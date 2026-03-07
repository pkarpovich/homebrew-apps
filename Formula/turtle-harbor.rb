class TurtleHarbor < Formula
  desc "Script manager daemon with auto-restart and cron scheduling"
  homepage "https://github.com/pkarpovich/turtle-harbor"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pkarpovich/turtle-harbor/releases/download/v0.6.0/turtle-harbor-aarch64-apple-darwin.tar.gz"
      sha256 "0cf562ddaa2a7b5c8507bbff094073f9cee7dad4a8ac08e4a8fb76e3b4a075d8"
    end
    on_intel do
      url "https://github.com/pkarpovich/turtle-harbor/releases/download/v0.6.0/turtle-harbor-x86_64-apple-darwin.tar.gz"
      sha256 "a9543f1760c91e2210f161b9828e045755c09e69af7d2dae3aedb284b198a055"
    end
  end

  def install
    bin.install "th"
    bin.install "turtled"
  end

  test do
    assert_match "turtle-harbor", shell_output("\#{bin}/th --help")
  end
end
