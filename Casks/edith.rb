cask "edith" do
  version "0.2.0"
  sha256 "77230039d9055a67d750552bf8322e2d0ea259932a758664f97443b89d1581b1"

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
