# Synced from realtime-interview-copilot release CI via scripts/sync-distribution.js
cask "realtime-interview-copilot" do
  version "0.14.3-beta"
  sha256 "273ac6e6f0748d4ae213a76f5931e94cbd3becf03901d3550a050ccd3dc9709b"

  url "https://github.com/innovatorved/realtime-interview-copilot/releases/download/v#{version}/Realtime.Interview.Copilot.Beta-#{version}-mac-arm64.dmg",
      verified: "github.com/innovatorved/realtime-interview-copilot/"
  name "Meeting Copilot"
  desc "Real-time AI copilot for interviews (beta)"
  homepage "https://github.com/innovatorved/realtime-interview-copilot"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Realtime Interview Copilot Beta.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args:  ["-dr", "com.apple.quarantine",
                           "#{appdir}/Realtime Interview Copilot Beta.app"],
                   sudo:  false
  end

  uninstall quit: "com.realtime.interview.copilot.beta"

  zap trash: [
    "~/Library/Application Support/Realtime Interview Copilot Beta",
    "~/Library/Caches/com.realtime.interview.copilot.beta",
    "~/Library/Logs/Realtime Interview Copilot Beta",
    "~/Library/Preferences/com.realtime.interview.copilot.beta.plist",
    "~/Library/Saved Application State/com.realtime.interview.copilot.beta.savedState",
  ]

  caveats <<~EOS
    Meeting Copilot is distributed unsigned (no Apple Developer ID notarisation yet).
    This cask clears the macOS quarantine attribute on install so the app launches with one click.

    If macOS still blocks it (e.g. after a manual DMG install), run:

      xattr -dr com.apple.quarantine "/Applications/Realtime Interview Copilot Beta.app"

    Apple Silicon (arm64) only for now.

    To update: `brew update && brew upgrade --cask realtime-interview-copilot`
  EOS
end
