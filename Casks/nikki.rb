cask "nikki" do
  version "0.4.0"
  sha256 "69a689d3061bc8dfa6e37ae40cd557e8407da5a481b12e2f80ab8ffbd4c325df"

  url "https://github.com/pkarpovich/nikki/releases/download/v#{version}/Nikki-arm64-#{version}.zip"
  name "nikki"
  desc "macOS activity capture daemon"
  homepage "https://github.com/pkarpovich/nikki"

  depends_on arch: :arm64

  # The app is what makes the macOS permissions durable. TCC identifies a
  # bundle by its identifier at a path that never moves, and a loose binary
  # by its path alone - so the Homebrew formula this cask replaced lost the
  # Accessibility grant on every upgrade, the Cellar path carrying the
  # version. The binary stanza keeps \`nikki\` on PATH, pointing inside the
  # app rather than at a copy, so an upgrade replaces both at once.
  app "Nikki.app"
  binary "#{appdir}/Nikki.app/Contents/MacOS/nikki"

  caveats <<~CAVEATS
    Write ~/.config/nikki/config.toml BEFORE installing the service.
    service_url and device are required and the daemon exits without
    them, which under keep_alive is a restart loop. The full set of
    keys is in the README; the minimum is:

      service_url = "https://nikki.example"
      device = "mbp-21"

      [browser]
      profile = "MBP_21"

    Then:

      nikki --check-config
      nikki install

    \`nikki install\` writes the launchd agent dev.pkarpovich.nikki and
    starts it. It also unloads and removes the agent \`brew services\`
    used to write, so the two never run at once. An upgrade replaces
    the app in place and needs nothing further.

    Grant Accessibility to Nikki in System Settings > Privacy &
    Security, then \`nikki install\` once more - macOS caches the denial
    for the life of the process. Without it capture continues, but every
    window title and document path is null and the records carry
    degraded: true. The grant survives upgrades: the app is identified
    by its bundle id at a path that does not move.

    The first time it reads a browser tab macOS asks for Automation
    access to Dia. Declining is permanent for this binary and the only
    symptom is a -1743 in the log.

    Logs are at ~/Library/Logs/nikki.log and nikki.err.log.
  CAVEATS

  uninstall quit:      "dev.pkarpovich.nikki",
            launchctl: "dev.pkarpovich.nikki"

  zap trash: [
    "~/.config/nikki",
    "~/Library/Application Support/nikki",
    "~/Library/Logs/nikki.log",
    "~/Library/Logs/nikki.err.log",
  ]
end
