# Synced from sayItflow release CI via scripts/sync-distribution.js
cask "sayitflow" do
  version "1.3.0"
  sha256 "a135c49e94f836e7ed7ab41707de95d1efd27af333483a00aba355eb066d98d8"

  url "https://github.com/innovatorved/sayItflow/releases/download/v#{version}/SayItFlow.dmg"
  name "SayItFlow"
  desc "100% on-device push-to-talk voice dictation for macOS"
  homepage "https://github.com/innovatorved/sayItflow"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "SayItFlow.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/SayItFlow.app"]
  end

  uninstall quit: "com.innovatorved.sayitflow"

  zap trash: [
    "~/Library/Application Support/com.innovatorved.sayitflow",
    "~/Library/Caches/com.innovatorved.sayitflow",
    "~/Library/Preferences/com.innovatorved.sayitflow.plist",
  ]

  caveats <<~EOS
    SayItFlow is distributed ad-hoc signed for Apple Silicon.
    This cask clears the macOS quarantine attribute on install so the app launches cleanly.

    If macOS still blocks it, run:

      xattr -dr com.apple.quarantine "/Applications/SayItFlow.app"

    Apple Silicon (arm64) only. Requires macOS Sonoma (14.0) or later.

    To update: `brew update && brew upgrade --cask sayitflow`
  EOS
end
