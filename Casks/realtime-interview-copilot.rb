# Synced to github.com/innovatorved/homebrew-tap by CI.
# `scripts/update-homebrew-cask.js` overwrites version, sha256, and url —
# artifact filenames use dots (electron-builder/GitHub asset name); the
# download path segment uses the Git tag (may differ from package.json semver).

cask "realtime-interview-copilot" do
  version "0.7.0-beta"
  sha256 "20d6d48b5620b5a49779350ceed959ee3bbff223e1021c2725afc30946b87ca6"

  url "https://github.com/innovatorved/realtime-interview-copilot/releases/download/v0.7.0-beta/Realtime%20Interview%20Copilot%20Beta-0.7.0-beta-mac-arm64.dmg",
      verified: "github.com/innovatorved/realtime-interview-copilot/"
  name "Realtime Interview Copilot Beta"
  desc "Real-time AI copilot for interviews (beta)"
  homepage "https://github.com/innovatorved/realtime-interview-copilot"

  depends_on arch: :arm64

  app "Realtime Interview Copilot Beta.app"
end
