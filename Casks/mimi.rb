cask "mimi" do
  version "0.2.0"
  sha256 "ddb6b4aa3703c984d83c054314d69940b7a0bfece86ed0aaf06384c46e597818"

  url "https://github.com/pkarpovich/mimi/releases/download/v#{version}/Mimi-arm64-#{version}.zip"
  name "mimi"
  desc "Meeting recorder daemon"
  homepage "https://github.com/pkarpovich/mimi"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  # The app is what makes the microphone grant durable. TCC identifies a
  # bundle by its identifier at a path that never moves, and a loose binary
  # by its path alone - which a versioned Cellar path changes on every
  # upgrade. The binary stanza keeps `mimi` on PATH, pointing inside the
  # app rather than at a copy, so an upgrade replaces both at once.
  app "Mimi.app"
  binary "#{appdir}/Mimi.app/Contents/MacOS/mimi"

  # Homebrew upgrades a cask by uninstalling the old version first, and the
  # uninstall stanza below unloads the agent and removes its plist. Without
  # this the daemon is simply gone after every upgrade, silently. postflight
  # runs on install and on upgrade alike, and mimi install is idempotent.
  # It stays a Ruby block rather than postflight_steps, measured on brew
  # 6.0.22: the steps sandbox substitutes HOME with a temporary directory,
  # so mimi install writes the plist there and launchctl refuses to
  # bootstrap it - and the failed step rolls the whole install back.
  # brew style flags this (Cask/InstallSteps); the offense is the price.
  postflight do
    system_command "#{appdir}/Mimi.app/Contents/MacOS/mimi",
                   args: ["install"]
  end

  uninstall launchctl: "dev.pkarpovich.mimi",
            quit:      "dev.pkarpovich.mimi"

  # Recordings are deliberately absent: zap removes what the app owns,
  # and the meetings belong to whoever recorded them.
  zap trash: [
    "~/.config/mimi",
    "~/Library/Logs/mimi.err.log",
    "~/Library/Logs/mimi.log",
  ]

  caveats <<~CAVEATS
    mimi starts on its own: installing the cask writes the launchd
    agent dev.pkarpovich.mimi and loads it, and an upgrade does the
    same again. Nothing to run by hand.

    The first time a meeting starts, macOS asks for the microphone.
    Granting it is what makes the recording carry your voice; without
    it the left channel is silence and nothing else reports a problem.
    The grant survives upgrades: the app is identified by its bundle
    id at a path that does not move.

    Configuration, recordings and logs are described in the README:
    https://github.com/pkarpovich/mimi#readme
  CAVEATS
end
