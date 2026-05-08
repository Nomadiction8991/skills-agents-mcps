const fs = require('fs');
const path = require('path');
const os = require('os');

const TARGETS = [
    { name: 'Claude', dir: path.join(os.homedir(), '.claude') },
    { name: 'Codex', dir: path.join(os.homedir(), '.codex') },
    { name: 'Gemini', dir: path.join(os.homedir(), '.gemini') }
];

const REPO_ROOT = path.resolve(__dirname, '..');
const PLUGINS_DIR = path.join(REPO_ROOT, 'plugins');

TARGETS.forEach(target => {
    const settingsPath = path.join(target.dir, 'settings.json');
    if (!fs.existsSync(settingsPath)) return;

    console.log(`--- Wiring hooks for ${target.name} ---`);
    const settings = JSON.parse(fs.readFileSync(settingsPath, 'utf8'));
    if (!settings.hooks) settings.hooks = {};

    // Map Claude hooks to Gemini equivalents
    const GEMINI_HOOK_MAP = {
        'PreToolUse': 'BeforeTool',
        'PostToolUse': 'AfterTool',
        'SessionStart': 'SessionStart',
        'UserPromptSubmit': 'BeforeAgent',
        'PreCompact': 'PreCompress',
        'Stop': 'Stop'
    };

    const pluginDirs = fs.readdirSync(PLUGINS_DIR).filter(f => fs.statSync(path.join(PLUGINS_DIR, f)).isDirectory());

    pluginDirs.forEach(plugin => {
        const hooksJsonPath = path.join(PLUGINS_DIR, plugin, 'hooks', 'hooks.json');
        if (fs.existsSync(hooksJsonPath)) {
            console.log(`Wiring hooks for plugin: ${plugin}...`);
            const hooksConfig = JSON.parse(fs.readFileSync(hooksJsonPath, 'utf8'));
            const pluginRoot = path.join(PLUGINS_DIR, plugin);

            const hooksSource = hooksConfig.hooks || hooksConfig;
            const isGemini = settingsPath.includes('.gemini');

            Object.keys(hooksSource).forEach(eventType => {
                if (eventType === 'description') return;
                
                let targetEvent = eventType;
                if (isGemini) {
                    targetEvent = GEMINI_HOOK_MAP[eventType];
                    if (!targetEvent) return; // Skip hooks that don't map to Gemini
                }

                if (!settings.hooks[targetEvent]) settings.hooks[targetEvent] = [];

                // Remove existing hooks from THIS plugin to avoid duplicates/stale commands
                settings.hooks[targetEvent] = settings.hooks[targetEvent].filter(existing => {
                    const str = JSON.stringify(existing);
                    return !str.includes(pluginRoot);
                });

                const hookGroups = Array.isArray(hooksSource[eventType]) ? hooksSource[eventType] : [];
                hookGroups.forEach(hookGroup => {
                    let raw = JSON.stringify(hookGroup);
                    raw = raw.replace(/\$\{CLAUDE_PLUGIN_ROOT\}/g, pluginRoot);
                    
                    // Specific fix for context-mode: use its own hooks/gemini-cli/ scripts for Gemini
                    if (isGemini && plugin === 'context-mode') {
                        raw = raw.replace(/\/hooks\/([a-z]+)\.mjs/g, (match, name) => {
                           const geminiScript = path.join(pluginRoot, 'hooks', 'gemini-cli', `${name}.mjs`);
                           if (fs.existsSync(geminiScript)) return `/hooks/gemini-cli/${name}.mjs`;
                           return match;
                        });
                    }

                    const processedHookGroup = JSON.parse(raw);
                    
                    settings.hooks[targetEvent].push(processedHookGroup);
                    console.log(`  Synced ${targetEvent} hook group.`);
                });
            });
        }
    });

    // Final sanity check: if context-mode is present, call its internal upgrade to fix Node paths/permissions
    const ctxModeRoot = path.join(PLUGINS_DIR, 'context-mode');
    if (fs.existsSync(ctxModeRoot)) {
        console.log("  Running context-mode upgrade for final calibration...");
        try {
            const { execSync } = require('child_process');
            // Run upgrade non-interactively if possible (we patched cli.ts to be more robust)
            execSync(`node "${path.join(ctxModeRoot, 'cli.bundle.mjs')}" upgrade`, { stdio: 'inherit' });
        } catch (e) {
            console.log("  Warning: context-mode upgrade failed, continuing...");
        }
    }

    fs.writeFileSync(settingsPath, JSON.stringify(settings, null, 2) + '\n');
    console.log(`Done wiring hooks for ${target.name}.`);
});
