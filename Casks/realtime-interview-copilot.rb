# Synced to github.com/innovatorved/homebrew-tap by CI.
# `scripts/update-homebrew-cask.js` overwrites version + sha256 using
# package.json and the arm64 DMG in release-assets/.

cask "realtime-interview-copilot" do
  version "0.7.0-beta"
  sha256 "3b6ff772085a76e50355f2e4de4e99326f277590b5b8ccaf7fcdc5679aa1365a"

  url "https://github.com/innovatorved/realtime-interview-copilot/releases/download/v#{version}/Realtime%20Interview%20Copilot%20Beta-#{version}-mac-arm64.dmg",
      verified: "github.com/innovatorved/realtime-interview-copilot/"
  name "Realtime Interview Copilot Beta"
  desc "Real-time AI copilot for interviews (beta)"
  homepage "https://github.com/innovatorved/realtime-interview-copilot"

  depends_on arch: :arm64

  app "Realtime Interview Copilot Beta.app"
end
