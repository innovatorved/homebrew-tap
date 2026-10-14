# Synced from sayItflow release CI via scripts/sync-cask.js
cask "sayitflow" do
  version "1.4.0"
  sha256 "fa2d5dd83c9ca345adbe8af377ce386354a1d140d4efd319f2b9e1f1a4ec463a"

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
