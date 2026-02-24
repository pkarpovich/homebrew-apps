class TurtleHarbor < Formula
  desc "Script manager daemon with auto-restart and cron scheduling"
  homepage "https://github.com/pkarpovich/turtle-harbor"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pkarpovich/turtle-harbor/releases/download/v0.4.0/turtle-harbor-aarch64-apple-darwin.tar.gz"
      sha256 "be6090b2cf9decdef7ef8f9c73681905e22b3a30ff93d10cbb2a184af169e964"
    end
    on_intel do
      url "https://github.com/pkarpovich/turtle-harbor/releases/download/v0.4.0/turtle-harbor-x86_64-apple-darwin.tar.gz"
      sha256 "3b32eca534eb74a17f2846a83551682145d9eca9f17b5dc6eaba01174ab435c2"
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
