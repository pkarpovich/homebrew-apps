cask "edith" do
  version "0.2.1"
  sha256 "7f4e7243e6d5cd283a5a4effecea234da3c69d741e1b7c7e64c2696ad72239bb"

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
