# Synced to github.com/innovatorved/homebrew-tap by CI.
# DMG name must match package.json build.artifactName (URL-safe, no spaces).
# `scripts/update-homebrew-cask.js` sets version + sha256; the url uses #{version}
# so the Git tag (v0.x.x) and filename stay aligned with the cask version stanza.

cask "realtime-interview-copilot" do
  version "0.7.0-beta"
  sha256 "50aa34198a9f01cc9753d47400a839fe8fdf9651cf6d09428bad8ad376add7c4"

  url "https://github.com/innovatorved/realtime-interview-copilot/releases/download/v#{version}/Realtime.Interview.Copilot.Beta-#{version}-mac-arm64.dmg",
      verified: "github.com/innovatorved/realtime-interview-copilot/"
  name "Realtime Interview Copilot Beta"
  desc "Real-time AI copilot for interviews (beta)"
  homepage "https://github.com/innovatorved/realtime-interview-copilot"

  depends_on arch: :arm64

  app "Realtime Interview Copilot Beta.app"
end
