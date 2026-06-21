# Synced from realtime-interview-copilot release CI via scripts/sync-distribution.js
cask "realtime-interview-copilot" do
  version "0.15.2-beta"
  sha256 "e9499dce3a233396d9a21ea527fa37fd3bfb17cb7b0e2b1677f655f61d036f53"

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

  app "Meeting Copilot.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args:  ["-dr", "com.apple.quarantine",
                           "#{appdir}/Meeting Copilot.app"],
                   sudo:  false
  end

  uninstall quit: "com.realtime.interview.copilot.beta"

  zap trash: [
    "~/Library/Application Support/Meeting Copilot",
    "~/Library/Caches/com.realtime.interview.copilot.beta",
    "~/Library/Logs/Meeting Copilot",
    "~/Library/Preferences/com.realtime.interview.copilot.beta.plist",
    "~/Library/Saved Application State/com.realtime.interview.copilot.beta.savedState",
  ]

  caveats <<~EOS
    Meeting Copilot is distributed unsigned (no Apple Developer ID notarisation yet).
    This cask clears the macOS quarantine attribute on install so the app launches with one click.

    If macOS still blocks it (e.g. after a manual DMG install), run:

      xattr -dr com.apple.quarantine "/Applications/Meeting Copilot.app"

    Apple Silicon (arm64) only for now.

    To update: `brew update && brew upgrade --cask realtime-interview-copilot`
  EOS
end
