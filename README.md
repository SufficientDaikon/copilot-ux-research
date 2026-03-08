# copilot-ux-research

> **Part of [sdd-vscode-agents](https://github.com/SufficientDaikon/sdd-vscode-agents)** — install the full collection for the complete SDD pipeline + UI/UX lifecycle.

A VS Code Copilot agent plugin that conducts user research, creates personas, maps user journeys, and performs competitive analysis.

## What it does

The **ux-research** agent produces research briefs:
- Creates detailed user personas with goals, frustrations, and behaviors
- Maps user journey flows with touchpoints and pain points
- Performs competitive analysis with feature matrices
- Synthesizes findings into actionable design requirements
- Identifies opportunities and risk areas

## Hooks included

| Hook | Event | What it does |
|------|-------|-------------|
| **Project context** | `SessionStart` | Auto-detects README.md and package.json to understand the project before research |
| **Research completion** | `Stop` | Checks for research-brief.md and suggests next step (information architecture) |

## Install

### Via Copilot CLI
```bash
copilot plugin install SufficientDaikon/copilot-ux-research
```

### Via VS Code settings

Clone the repo and add to your `settings.json`:
```json
"chat.plugins.paths": {
    "/path/to/copilot-ux-research": true
}
```

### Via local path
```bash
git clone https://github.com/SufficientDaikon/copilot-ux-research.git
copilot plugin install ./copilot-ux-research
```

## Usage

Switch to the **ux-research** agent in VS Code chat, then:
```
Conduct UX research for this project
```
**Expected output**: A research-brief.md with personas, journey maps, competitive analysis, and design requirements.

## Pipeline position

```
**ux-research** -> info-arch -> wireframe
```

## Full collection

This agent works best as part of the full SDD + UI/UX pipeline. Install all 13 agents:

```bash
copilot plugin install SufficientDaikon/sdd-vscode-agents
```

See the [full collection](https://github.com/SufficientDaikon/sdd-vscode-agents) for documentation and the complete agent list.

## License

MIT
