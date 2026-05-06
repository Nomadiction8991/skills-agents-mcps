const fs = require('fs');
const path = require('path');
const os = require('os');

const CLAUDE_DIR = process.env.CLAUDE_CONFIG_DIR || path.join(os.homedir(), '.claude');
const SETTINGS_PATH = path.join(CLAUDE_DIR, 'settings.json');
const REPO_ROOT = path.resolve(__dirname, '..');
const PLUGINS_DIR = path.join(REPO_ROOT, 'plugins');

if (!fs.existsSync(SETTINGS_PATH)) {
    console.log('Settings file not found at:', SETTINGS_PATH);
    process.exit(1);
}

const settings = JSON.parse(fs.readFileSync(SETTINGS_PATH, 'utf8'));
if (!settings.hooks) settings.hooks = {};

const pluginDirs = fs.readdirSync(PLUGINS_DIR).filter(f => fs.statSync(path.join(PLUGINS_DIR, f)).isDirectory());

pluginDirs.forEach(plugin => {
    const hooksJsonPath = path.join(PLUGINS_DIR, plugin, 'hooks', 'hooks.json');
    if (fs.existsSync(hooksJsonPath)) {
        console.log(`Wiring hooks for plugin: ${plugin}...`);
        const hooksConfig = JSON.parse(fs.readFileSync(hooksJsonPath, 'utf8'));
        const pluginRoot = path.join(PLUGINS_DIR, plugin);

        const hooksSource = hooksConfig.hooks || hooksConfig;

        Object.keys(hooksSource).forEach(eventType => {
            if (eventType === 'description') return;
            if (!settings.hooks[eventType]) settings.hooks[eventType] = [];

            const hookGroups = Array.isArray(hooksSource[eventType]) ? hooksSource[eventType] : [];
            hookGroups.forEach(hookGroup => {
                // Resolve ${CLAUDE_PLUGIN_ROOT} or similar
                const processedHookGroup = JSON.parse(JSON.stringify(hookGroup).replace(/\$\{CLAUDE_PLUGIN_ROOT\}/g, pluginRoot));
                
                // Check if already exists to avoid duplicates
                const alreadyExists = settings.hooks[eventType].some(existing => 
                    JSON.stringify(existing) === JSON.stringify(processedHookGroup)
                );

                if (!alreadyExists) {
                    settings.hooks[eventType].push(processedHookGroup);
                    console.log(`  Added ${eventType} hook group.`);
                } else {
                    console.log(`  ${eventType} hook group already exists.`);
                }
            });
        });
    }
});

fs.writeFileSync(SETTINGS_PATH, JSON.stringify(settings, null, 2) + '\n');
console.log('Done wiring hooks.');
