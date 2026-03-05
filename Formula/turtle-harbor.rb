class TurtleHarbor < Formula
  desc "Script manager daemon with auto-restart and cron scheduling"
  homepage "https://github.com/pkarpovich/turtle-harbor"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pkarpovich/turtle-harbor/releases/download/v0.5.1/turtle-harbor-aarch64-apple-darwin.tar.gz"
      sha256 "b85e239a5a75933ce6008279801fbd1845a6653ca64ea31faa06b856e4f169f6"
    end
    on_intel do
      url "https://github.com/pkarpovich/turtle-harbor/releases/download/v0.5.1/turtle-harbor-x86_64-apple-darwin.tar.gz"
      sha256 "e63e19114c6200133fbca0411beaefb4eb2e2752ca4788ca780263558c7d8fd6"
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
