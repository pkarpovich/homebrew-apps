class TurtleHarbor < Formula
  desc "Script manager daemon with auto-restart and cron scheduling"
  homepage "https://github.com/pkarpovich/turtle-harbor"
  version "0.6.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pkarpovich/turtle-harbor/releases/download/v0.6.5/turtle-harbor-aarch64-apple-darwin.tar.gz"
      sha256 "2823a4e674e70b02b7fd22f0e12896d103d2a077a2fec743f99abd779724c440"
    end
    on_intel do
      url "https://github.com/pkarpovich/turtle-harbor/releases/download/v0.6.5/turtle-harbor-x86_64-apple-darwin.tar.gz"
      sha256 "09021ddb8b8d62aa8206600246fba2cbba259413d58da7a1abcb5995186caa7a"
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
