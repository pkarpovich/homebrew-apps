cask "gidora" do
  version "0.2.0"
  sha256 "a6401511548538151d210edaa71f01dfd8fe3d9c9b0e29524b3ed68304b3b05b"

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
