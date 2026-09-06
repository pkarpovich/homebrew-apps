cask "claude-usage-bar" do
  version "0.0.10"
  sha256 "54894d2e4ac56b6d0d08c12ca9da7009753b31f96cbd0d46bf3fae2197199e1b"

  url "https://github.com/Blimp-Labs/claude-usage-bar/releases/download/v#{version}/ClaudeUsageBar.zip"
  name "Claude Usage Bar"
  desc "Menu bar app that shows Claude API usage at a glance"
  homepage "https://github.com/Blimp-Labs/claude-usage-bar"

  livecheck do
    url :url
    strategy :github_latest
  end

  # updates itself through Sparkle; brew only steps in when the bundle falls behind
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "ClaudeUsageBar.app"

  uninstall quit:       "com.local.ClaudeUsageBar",
            login_item: "ClaudeUsageBar"

  zap trash: [
    "~/Library/Caches/com.local.ClaudeUsageBar",
    "~/Library/HTTPStorages/com.local.ClaudeUsageBar",
    "~/Library/Preferences/com.local.ClaudeUsageBar.plist",
  ]
end
