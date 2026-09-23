cask "nikki" do
  version "0.6.0"
  sha256 "4dedaa13c1280dbe77d96c99005ef584c67e0a75ab293d3d56dcefdcf21f2733"

  url "https://github.com/pkarpovich/nikki/releases/download/v#{version}/Nikki-arm64-#{version}.zip"
  name "nikki"
  desc "Activity capture daemon"
  homepage "https://github.com/pkarpovich/nikki"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  # The app is what makes the macOS permissions durable. TCC identifies a
  # bundle by its identifier at a path that never moves, and a loose binary
  # by its path alone - so the Homebrew formula this cask replaced lost the
  # Accessibility grant on every upgrade, the Cellar path carrying the
  # version. The binary stanza keeps `nikki` on PATH, pointing inside the
  # app rather than at a copy, so an upgrade replaces both at once.
  app "Nikki.app"
  binary "#{appdir}/Nikki.app/Contents/MacOS/nikki"

  # launchd is nikki's business, not the cask's. `nikki install` writes the
  # agent once; on an upgrade the running daemon notices its bundle was
  # swapped, flushes what it holds and exits, and launchd - keeping the agent
  # alive only while the bundle's own binary exists - starts the new version.
  # An uninstall stanza unloading the agent would take it down on every
  # upgrade and leave it down, and loading it back from postflight_steps is
  # impossible: the steps sandbox cannot talk to launchd.

  zap trash: [
    "~/.config/nikki",
    "~/Library/Application Support/nikki",
    "~/Library/LaunchAgents/dev.pkarpovich.nikki.plist",
    "~/Library/Logs/nikki.err.log",
    "~/Library/Logs/nikki.log",
  ]

  caveats <<~CAVEATS
    Write ~/.config/nikki/config.toml BEFORE installing the service.
    service_url and device are required and the daemon exits without
    them, which under a launchd agent is a restart loop. The full set
    of keys is in the README; the minimum is:

      service_url = "https://nikki.example"
      device = "mbp-21"

      [browser]
      profile = "MBP_21"

    Then, once:

      nikki --check-config
      nikki install

    That writes the launchd agent dev.pkarpovich.nikki and starts it.
    It also unloads and removes the agent `brew services` used to
    write, so the two never run at once. Upgrades need nothing: the
    running daemon notices the new bundle, flushes what it holds and
    restarts itself.

    Grant Accessibility to Nikki in System Settings > Privacy &
    Security, then `nikki install` once more - macOS caches the denial
    for the life of the process. Without it capture continues, but every
    window title and document path is null and the records carry
    degraded: true. The grant survives upgrades: the app is identified
    by its bundle id at a path that does not move.

    The first time it reads a browser tab macOS asks for Automation
    access to Dia. Declining is permanent for this binary and the only
    symptom is a -1743 in the log.

    Logs are at ~/Library/Logs/nikki.log and nikki.err.log.
  CAVEATS
end
