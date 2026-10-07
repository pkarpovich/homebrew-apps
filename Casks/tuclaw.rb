cask "tuclaw" do
  version "0.3.0"
  sha256 "400b2058b4dc09942ed5365d21550bccae51017de383082de328ff483b4d76d9"

  url "https://github.com/pkarpovich/tuclaw-desktop/releases/download/v#{version}/Tuclaw-arm64-#{version}.zip"
  name "Tuclaw"
  desc "Desktop client for the tuclaw agent daemon"
  homepage "https://github.com/pkarpovich/tuclaw-desktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Tuclaw.app"

  zap trash: [
    "~/Library/Application Support/tuclaw-desktop",
    "~/Library/Caches/tuclaw-desktop",
  ]
end
