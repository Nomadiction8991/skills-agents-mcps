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
                
                // Gemini only supports certain hook events
                if (isGemini && !['SessionStart', 'Stop'].includes(eventType)) {
                    // console.log(`  Skipping event ${eventType} for Gemini (unsupported).`);
                    return;
                }

                if (!settings.hooks[eventType]) settings.hooks[eventType] = [];

                // Remove existing hooks from THIS plugin to avoid duplicates/stale commands
                settings.hooks[eventType] = settings.hooks[eventType].filter(existing => {
                    const str = JSON.stringify(existing);
                    return !str.includes(pluginRoot);
                });

                const hookGroups = Array.isArray(hooksSource[eventType]) ? hooksSource[eventType] : [];
                hookGroups.forEach(hookGroup => {
                    const processedHookGroup = JSON.parse(JSON.stringify(hookGroup).replace(/\$\{CLAUDE_PLUGIN_ROOT\}/g, pluginRoot));
                    
                    settings.hooks[eventType].push(processedHookGroup);
                    console.log(`  Synced ${eventType} hook group.`);
                });
            });
        }
    });

    fs.writeFileSync(settingsPath, JSON.stringify(settings, null, 2) + '\n');
    console.log(`Done wiring hooks for ${target.name}.`);
});
