class YashikiLayoutKakejiku < Formula
  desc "Vertical row layout engine for the yashiki window manager"
  homepage "https://github.com/pkarpovich/yashiki-layout-kakejiku"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pkarpovich/yashiki-layout-kakejiku/releases/download/v0.1.0/yashiki-layout-kakejiku-aarch64-apple-darwin.tar.gz"
      sha256 "26acd52a8c6c3c9283025f2403875d4c24c41f879235ba58b56f4f8528e33042"
    end
    on_intel do
      url "https://github.com/pkarpovich/yashiki-layout-kakejiku/releases/download/v0.1.0/yashiki-layout-kakejiku-x86_64-apple-darwin.tar.gz"
      sha256 "b2bae637c0cc6e76f49f57e322c429e6c176936706a082b53b46ff1c2d08c210"
    end
  end

  def install
    bin.install "yashiki-layout-kakejiku"
  end

  test do
    request = '{"type":"layout","width":1000,"height":3000,"windows":[1,2]}' + "\n"
    output = pipe_output("#{bin}/yashiki-layout-kakejiku", request)
    assert_match '"type":"layout"', output
  end
end
