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

## Quick start — Meeting Copilot (`realtime-interview-copilot`)

Real-time AI copilot for interviews. Requires **macOS Big Sur+** and **Apple Silicon**.

```bash
brew tap innovatorved/tap
brew install --cask realtime-interview-copilot
```

If an existing app is already installed in `/Applications`:

```bash
brew install --cask --force realtime-interview-copilot
```

Docs: [github.com/innovatorved/realtime-interview-copilot](https://github.com/innovatorved/realtime-interview-copilot)

## Quick start — SayItFlow (`sayitflow`)

100% on-device push-to-talk voice dictation. Requires **macOS Sonoma+** and **Apple Silicon**.

```bash
brew tap innovatorved/tap
brew install --cask sayitflow
```

If an existing app is already installed in `/Applications`:

```bash
brew install --cask --force sayitflow
```

Docs: [github.com/innovatorved/sayItflow](https://github.com/innovatorved/sayItflow)

## Formulae

| Formula | Description |
|---------|-------------|
| `dev` | SayItDev CLI — on-device LLM + voice modes |

## Casks

| Cask | Description |
|------|-------------|
| `realtime-interview-copilot` | Real-time interview copilot app |
| `sayitflow` | 100% on-device push-to-talk voice dictation for macOS |

## Upgrade

```bash
brew update
brew upgrade innovatorved/tap/dev
brew upgrade --cask realtime-interview-copilot
brew upgrade --cask sayitflow
```

