cask "realtime-interview-copilot" do
  version "0.5.0-beta"
  sha256 "012809904cdafd11f566ab2119bcba9b452151628c677eff0d22ea8ccdfa9477"

  url "https://github.com/innovatorved/realtime-interview-copilot/releases/download/v#{version}/Realtime.Interview.Copilot.Beta-#{version}-mac-arm64.dmg"
  name "Realtime Interview Copilot"
  desc "Real-time AI copilot for interviews with live transcription and vision Ask AI"
  homepage "https://github.com/innovatorved/realtime-interview-copilot"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  app "Realtime Interview Copilot Beta.app"

  # The app is ad-hoc signed (not notarized). Strip the quarantine attribute
  # so macOS Gatekeeper does not block it on first launch. Users who want to
  # verify the binary themselves can inspect the .app before running.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Realtime Interview Copilot Beta.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Realtime Interview Copilot Beta",
    "~/Library/Logs/Realtime Interview Copilot Beta",
    "~/Library/Preferences/com.realtime.interview.copilot.beta.plist",
    "~/Library/Saved Application State/com.realtime.interview.copilot.beta.savedState",
  ]
end
