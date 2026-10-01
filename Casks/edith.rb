cask "edith" do
  version "0.2.2"
  sha256 "da2a963d175cfe89b758d1470f5f9ffc6ea798b1fa8052c62a0f3b3a1f2035fb"

  url "https://github.com/pkarpovich/edith/releases/download/v#{version}/Edith-#{version}.dmg"
  name "Edith"
  desc "Hotkey-driven text fixer powered by Claude"
  homepage "https://github.com/pkarpovich/edith"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "Edith.app"

  zap trash: [
    "~/Library/Containers/space.pkarpovich.edith",
    "~/Library/Preferences/space.pkarpovich.edith.plist",
    "~/Library/Application Support/space.pkarpovich.edith",
  ]
end
