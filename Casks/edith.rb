cask "edith" do
  version "0.1.2"
  sha256 "04f7ac4e2812d6a45b12b995bbfd427de32e6bc33cfdd5d9cd59f864c1cd6d97"

  url "https://github.com/pkarpovich/edith/releases/download/v#{version}/Edith-#{version}.dmg"
  name "Edith"
  desc "Hotkey-driven text fixer powered by Claude"
  homepage "https://github.com/pkarpovich/edith"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :tahoe"

  app "Edith.app"

  zap trash: [
    "~/Library/Containers/space.pkarpovich.edith",
    "~/Library/Preferences/space.pkarpovich.edith.plist",
    "~/Library/Application Support/space.pkarpovich.edith",
  ]
end
