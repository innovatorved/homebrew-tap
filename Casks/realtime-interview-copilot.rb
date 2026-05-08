# Synced to github.com/innovatorved/homebrew-tap by CI.
# `scripts/update-homebrew-cask.js` overwrites version + sha256 using
# package.json and the arm64 DMG in release-assets/.

cask "realtime-interview-copilot" do
  version "0.5.0-beta"
  sha256 "e1610adf73977bdcc0e0b50d55a83c0e7a3619116604cd39b82f050dacbc2ec9"

  url "https://github.com/innovatorved/realtime-interview-copilot/releases/download/v#{version}/Realtime%20Interview%20Copilot%20Beta-#{version}-mac-arm64.dmg",
      verified: "github.com/innovatorved/realtime-interview-copilot/"
  name "Realtime Interview Copilot Beta"
  desc "Real-time AI copilot for interviews (beta)"
  homepage "https://github.com/innovatorved/realtime-interview-copilot"

  depends_on arch: :arm64

  app "Realtime Interview Copilot Beta.app"
end
