cask "tuclaw" do
  version "0.2.0"
  sha256 "de4e19ce5b2e40e7cd1fb8fcea6829980ee8592d69c70356b9b85ef1721e5f99"

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
