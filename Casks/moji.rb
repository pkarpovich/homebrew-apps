cask "moji" do
  version "0.1.0"
  sha256 "ced0bbd8fbc66ae2c65564f64810d85c4b89b75f2a2c742a586c20909c2ebcfd"

  url "https://github.com/pkarpovich/moji/releases/download/v#{version}/Moji-arm64-#{version}.zip"
  name "moji"
  desc "Keyboard layout switching daemon"
  homepage "https://github.com/pkarpovich/moji"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Moji.app"
  binary "#{appdir}/Moji.app/Contents/MacOS/moji"

  # No uninstall stanza and no postflight: unloading the agent on every
  # upgrade would leave it down, and postflight_steps cannot talk to
  # launchd. `moji install` writes the agent once; on an upgrade the daemon
  # notices its bundle was swapped and exits, and launchd starts the new one.

  zap trash: [
    "~/.config/moji",
    "~/Library/LaunchAgents/dev.pkarpovich.moji.plist",
    "~/Library/Logs/moji",
  ]

  caveats <<~CAVEATS
    Write ~/.config/moji/config.toml BEFORE installing the service: the
    daemon exits without one, which under a launchd agent is a restart
    loop. `moji list` prints the enabled layouts to name; the minimum is:

      cycle = ["en", "ru"]

      [layouts]
      en = "English - Universal"
      ru = "Russian - Universal"

    Then, once:

      moji --check-config
      moji install

    That writes the launchd agent dev.pkarpovich.moji and starts it. The
    first start asks for Input Monitoring, then for Accessibility; grant
    both to Moji in System Settings > Privacy & Security. The daemon exits
    until each grant lands and launchd starts it again, so nothing else
    needs to be run. The grants survive upgrades: the app is identified by
    its bundle id at a path that does not move.

    moji switches on F19. Point Karabiner (or the keyboard itself) at
    emitting F19 on the key that used to switch layouts, and remove every
    select_input_source from Karabiner: moji is the only thing that
    switches, and while it is not running F19 does nothing.

    Logs are at ~/Library/Logs/moji/moji.log and moji.err.log.
  CAVEATS
end
