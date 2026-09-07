cask "yafetch" do
  version "0.3.0"
  sha256 "bd392b5d30fe4dbcad1da7d0cc5620123dbcdddcd45b380d5b29ef4788faceb6"

  url "https://github.com/pkarpovich/yafetch/releases/download/v#{version}/yafetch-arm64-#{version}.zip"
  name "yafetch"
  desc "Minimal system information tool configured in Lua"
  homepage "https://github.com/pkarpovich/yafetch"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  binary "yafetch"

  zap trash: "~/.config/yafetch"

  caveats <<~CAVEATS
    yafetch reads ~/.config/yafetch/init.lua and exits without one.
    Start from the sample:

      mkdir -p ~/.config/yafetch
      curl -o ~/.config/yafetch/init.lua https://raw.githubusercontent.com/pkarpovich/yafetch/main/examples/sample.lua
  CAVEATS
end
