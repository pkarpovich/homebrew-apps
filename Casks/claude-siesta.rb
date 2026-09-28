cask "claude-siesta" do
  version "0.1.1"
  sha256 "f59faa696ecaf60d660505ece8cbc35b987cb4b9d2f65a9c1e4ec15c19d83526"

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
