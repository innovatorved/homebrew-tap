# Synced from realtime-interview-copilot release CI via scripts/sync-distribution.js
cask "realtime-interview-copilot" do
  version "0.16.1"
  sha256 "a3dcb4e987a485d6d055e8a0ed982404231a65c0fc313a047380447c864cdf6e"

  url "https://github.com/innovatorved/realtime-interview-copilot/releases/download/v#{version}/Realtime.Interview.Copilot.Beta-#{version}-mac-arm64.dmg"
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

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Meeting Copilot.app"]
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
