# innovatorved Homebrew Tap

Third-party formulae and casks for [innovatorved](https://github.com/innovatorved) projects.

## Quick start — SayItDev (`dev`)

On-device Apple Intelligence CLI (TTS, STT, OpenAI-compatible server). Requires **macOS 26+**, **Apple Silicon**, and **Apple Intelligence** enabled.

```bash
brew tap innovatorved/tap
brew install innovatorved/tap/dev
dev --version
dev --model-info
```

Voice smoke test:

```bash
dev --speak "Hello from SayItDev"
```

Docs: [github.com/innovatorved/sayitdev](https://github.com/innovatorved/sayitdev)

## Formulae

| Formula | Description |
|---------|-------------|
| `dev` | SayItDev CLI — on-device LLM + voice modes |

## Casks

| Cask | Description |
|------|-------------|
| `realtime-interview-copilot` | Real-time interview copilot app |

## Upgrade

```bash
brew update
brew upgrade innovatorved/tap/dev
```
