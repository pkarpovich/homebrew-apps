cask "mimi" do
  version "0.2.2"
  sha256 "d326f94660d04d7adee1fb8d59eead92520e9521c722825fc8fabd770e69ce78"

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

  # launchd is mimi's business, not the cask's. `mimi install` writes the
  # agent once; on an upgrade the running daemon notices its bundle was
  # swapped, finishes any recording in progress and exits, and launchd -
  # keeping the agent alive only while the bundle's own binary exists -
  # starts the new version. An uninstall stanza unloading the agent would
  # take it down on every upgrade, and loading it back from postflight_steps
  # is impossible: the steps sandbox cannot talk to launchd.

  # Recordings are deliberately absent: zap removes what the app owns,
  # and the meetings belong to whoever recorded them.
  zap trash: [
    "~/.config/mimi",
    "~/Library/LaunchAgents/dev.pkarpovich.mimi.plist",
    "~/Library/Logs/mimi.err.log",
    "~/Library/Logs/mimi.log",
  ]

  caveats <<~CAVEATS
    Once, after the first install:

      mimi install

    That writes the launchd agent dev.pkarpovich.mimi and starts it.
    Upgrades need nothing: the running daemon notices the new bundle,
    finishes any recording in progress and restarts itself.

    The first time a meeting starts, macOS asks for the microphone.
    Granting it is what makes the recording carry your voice; without
    it the left channel is silence and nothing else reports a problem.
    The grant survives upgrades: the app is identified by its bundle
    id at a path that does not move.

    Configuration, recordings and logs are described in the README:
    https://github.com/pkarpovich/mimi#readme
  CAVEATS
end
