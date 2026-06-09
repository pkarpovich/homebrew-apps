class TurtleHarbor < Formula
  desc "Script manager daemon with auto-restart and cron scheduling"
  homepage "https://github.com/pkarpovich/turtle-harbor"
  version "0.6.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pkarpovich/turtle-harbor/releases/download/v0.6.4/turtle-harbor-aarch64-apple-darwin.tar.gz"
      sha256 "786a94baa381a7322e1c5dd67c77a2f446201ffa9cfdec5e6be270676c2100f0"
    end
    on_intel do
      url "https://github.com/pkarpovich/turtle-harbor/releases/download/v0.6.4/turtle-harbor-x86_64-apple-darwin.tar.gz"
      sha256 "f9f8c24212188cfa82cfb4769941085e751c0608b68014bae1ef197856b05350"
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
