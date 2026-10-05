cask "tuclaw" do
  version "0.1.0"
  sha256 "e65cfd16f07b26b7626e0a74839c91235491b71f6753ed24fe59f413ef9e5cfc"

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
