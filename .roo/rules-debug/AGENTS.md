# AGENTS.md

This file provides guidance to agents when working with code in this repository.

## Stack

- **Node.js** >= 22.12.0 (ES modules only, no CommonJS)
- **npm** for package management
- **GitHub Actions** for CI/CD (nightly builds every 4 hours)
- **Bash** and **PowerShell** for deployment scripts
- **Bats** and **Pester** for testing

## Commands

### CLI (Local development)
```bash
npm run cli -- help              # Show help
npm run cli -- status            # Check translation status
npm run cli -- apply --dry-run   # Preview changes
npm run cli -- apply --verbose   # Show detailed logs
npm run cli -- verify            # Verify translations
npm run cli -- restore           # Restore original code
```

### Translation validation
```bash
node scripts/validate-translations.mjs --upstream ./openclaw
node scripts/detect-untranslated.mjs --upstream ./openclaw
```

### Testing
```bash
bats tests/bash/*.bats           # Run bash tests
powershell -File tests/powershell/*.Tests.ps1  # Run powershell tests
```

## Architecture

**Translation system:**
- Translation configs in [`translations/config.json`](translations/config.json) define modules and files
- Each translation file has `file` (source path), `description`, `replacements` (string replacements), and `copyFiles` (new files to copy)
- [`cli/utils/i18n-engine.mjs`](cli/utils/i18n-engine.mjs) loads and applies translations
- CLI automatically searches for OpenClaw in: `./openclaw`, `./upstream`, npm global root

**Build workflow:**
- [`build-core.yml`](.github/workflows/build-core.yml) is called by nightly and release workflows
- Clones upstream OpenClaw → applies translations → builds → injects feature panel
- Nightly builds run every 4 hours (cron: `42 */4 * * *`)

**Translation categories:**
- `cli` - CLI interface translations
- `wizard` - Onboarding wizard translations
- `tui` - Terminal UI translations
- `commands` - Command translations
- `dashboard` - Dashboard translations
- `extensions` - Extension translations
- `panel` - Feature panel (injected into Dashboard)
- `daemon` - Daemon translations
- `translations` - Translation system itself

## Critical Patterns

**Translation file format:**
```json
{
  "file": "src/cli/banner.ts",
  "description": "CLI banner",
  "replacements": {
    "const title = \"🦞 OpenClaw\"": "const title = \"🦞 OpenClaw 中文版\""
  }
}
```

**CLI target detection:**
The CLI searches for OpenClaw in multiple locations. If not found, use `--target=/path/to/openclaw`.

**Panel injection:**
Feature panel is injected into Dashboard build artifacts. Two scripts exist:
- [`scripts/inject_panel_node.mjs`](scripts/inject_panel_node.mjs) - Node.js version
- [`scripts/inject_panel.py`](scripts/inject_panel.py) - Python version (supports multiple Dashboard directories)

**Restore requires git:**
The `restore` command uses `git checkout` to revert changes. Target directory must be a git repository.

## Testing

Tests are in `tests/bash/` (Bats) and `tests/powershell/` (Pester). Tests are triggered on push/PR to main/develop branches.

## Deployment Scripts

- [`install.sh`](install.sh) - Install script (supports `--nightly` flag)
- [`docker-deploy.sh`](docker-deploy.sh) - Docker deployment script (supports `--token`, `--port`, `--local-only` flags)
