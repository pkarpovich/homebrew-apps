cask "mimi" do
  version "0.1.1"
  sha256 "83fd5e6143819a904774009d9381a790de1c30245d1e3464daf70cece023cc00"

  url "https://github.com/pkarpovich/mimi/releases/download/v#{version}/Mimi-arm64-#{version}.zip"
  name "mimi"
  desc "macOS meeting recorder daemon"
  homepage "https://github.com/pkarpovich/mimi"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  # The app is what makes the microphone grant durable. TCC identifies a
  # bundle by its identifier at a path that never moves, and a loose binary
  # by its path alone - which a versioned Cellar path changes on every
  # upgrade. The binary stanza keeps `mimi` on PATH, pointing inside the
  # app rather than at a copy, so an upgrade replaces both at once.
  app "Mimi.app"
  binary "#{appdir}/Mimi.app/Contents/MacOS/mimi"

  caveats <<~CAVEATS
    mimi runs with its defaults and needs no configuration to start.
    To change where recordings land or which applications trigger one,
    write ~/.config/mimi/config.toml - see the README for the keys -
    and check it with:

      mimi --check-config

    Then:

      mimi install

    That writes the launchd agent dev.pkarpovich.mimi and starts it.
    An upgrade replaces the app in place and needs nothing further.

    The first time a meeting starts, macOS asks for the microphone.
    Granting it is what makes the recording carry your voice; without
    it the left channel is silence and nothing else reports a problem.
    The grant survives upgrades: the app is identified by its bundle
    id at a path that does not move.

    Recordings land in ~/Recordings/mimi and are never deleted by
    mimi. Logs are at ~/Library/Logs/mimi.log and mimi.err.log.
  CAVEATS

  uninstall quit:      "dev.pkarpovich.mimi",
            launchctl: "dev.pkarpovich.mimi"

  # Recordings are deliberately absent: zap removes what the app owns,
  # and the meetings belong to whoever recorded them.
  zap trash: [
    "~/.config/mimi",
    "~/Library/Logs/mimi.log",
    "~/Library/Logs/mimi.err.log",
  ]
end
