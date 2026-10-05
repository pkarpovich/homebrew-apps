cask "eventkit-bridge" do
  version "0.2.0"
  sha256 "2f14d33cb89abc28ad4c578556a711c532115d29deb4f7409850870fbdaca054"

  url "https://github.com/pkarpovich/eventkit-bridge/releases/download/v#{version}/EventKitBridge-arm64-#{version}.zip"
  name "EventKitBridge"
  desc "HTTP API over the Mac's calendars through EventKit"
  homepage "https://github.com/pkarpovich/eventkit-bridge"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "EventKitBridge.app"
  binary "#{appdir}/EventKitBridge.app/Contents/MacOS/eventkit-bridge"

  zap launchctl: "dev.pkarpovich.eventkit-bridge",
      trash:     [
        "~/.config/eventkit-bridge",
        "~/Library/LaunchAgents/dev.pkarpovich.eventkit-bridge.plist",
        "~/Library/Logs/eventkit-bridge.log",
      ]

  caveats <<~EOS
    eventkit-bridge runs as a LaunchAgent and needs a config before its first start.

    1. Create ~/.config/eventkit-bridge/config.toml with the address to listen on,
       a literal IP such as your tailscale IP:
         listen = "100.64.0.1:8790"
    2. Check the config:
         eventkit-bridge --check-config
    3. Install and start the LaunchAgent:
         eventkit-bridge install
    4. Approve the Calendars prompt for EventKitBridge.
    5. Find your calendar ids in ~/Library/Logs/eventkit-bridge.log, add
       read_calendars and write_calendars to the config, then run
         eventkit-bridge install
       again.

    Upgrades need no action: the daemon restarts on the new version by itself.
  EOS
end
