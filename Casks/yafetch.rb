cask "yafetch" do
  version "0.4.0"
  sha256 "4e6808fcaa67d0fce6f28caea5a6f665066f198dbc962f43f31120cae24516ea"

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
    yafetch reads ~/.config/yafetch/init.lua and says so without one.
    Start from the sample:

      curl --create-dirs -o ~/.config/yafetch/init.lua https://raw.githubusercontent.com/pkarpovich/yafetch/main/examples/sample.lua

    `yafetch --help` lists what else it takes.
  CAVEATS
end
