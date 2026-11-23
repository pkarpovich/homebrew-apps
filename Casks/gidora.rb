cask "gidora" do
  version "0.2.1"
  sha256 "442b7ab78727d17f07c8ed501d8480ca1b1163810e92f7708155c23bba2ca2c9"

  url "https://github.com/pkarpovich/gidora/releases/download/v#{version}/Gidora-arm64.dmg"
  name "Gidora"
  desc "Chromium-based web browser"
  homepage "https://github.com/pkarpovich/gidora"

  # The fork carries the tags of its upstream, which look like newer
  # versions to the default tag check.
  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Gidora.app"
  binary "#{appdir}/Gidora.app/Contents/MacOS/gidoractl"

  uninstall quit: "space.pkarpovich.gidora"

  zap trash: [
    "~/Library/Application Support/space.pkarpovich.gidora",
    "~/Library/Caches/space.pkarpovich.gidora",
    "~/Library/Preferences/space.pkarpovich.gidora.plist",
  ]
end
