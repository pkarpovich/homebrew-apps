cask "claude-siesta" do
  version "0.1.0"
  sha256 "61a1d1f6e8ce6b34853afe2e4faa319d49ab34c41a2004068f21f33b6016b993"

  url "https://github.com/pkarpovich/claude-siesta/releases/download/v#{version}/claude-siesta-arm64-#{version}.zip"
  name "claude-siesta"
  desc "Parks idle Claude Code sessions in agterm"
  homepage "https://github.com/pkarpovich/claude-siesta"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  binary "claude-siesta"

  zap trash: [
    "~/.config/claude-siesta",
    "~/.local/state/claude-siesta",
    "~/Library/LaunchAgents/dev.pkarpovich.claude-siesta.plist",
    "~/Library/Logs/claude-siesta",
  ]

  caveats <<~CAVEATS
    Load the daemon once:

      claude-siesta install

    That writes the launchd agent dev.pkarpovich.claude-siesta and starts it.
    Upgrades need nothing else: the daemon exits when brew replaces its
    binary and launchd starts the new one.

    claude-siesta reads the cc-map entries Claude Code hooks write under
    ~/.local/state/agterm/cc-map and drives agterm through agtermctl.
    Logs are at ~/Library/Logs/claude-siesta and
    ~/.local/state/claude-siesta/claude-siesta.log.
  CAVEATS
end
