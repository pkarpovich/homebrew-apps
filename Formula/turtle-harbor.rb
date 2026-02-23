class TurtleHarbor < Formula
  desc "Script manager daemon with auto-restart and cron scheduling"
  homepage "https://github.com/pkarpovich/turtle-harbor"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pkarpovich/turtle-harbor/releases/download/v0.3.0/turtle-harbor-aarch64-apple-darwin.tar.gz"
      sha256 "05a51a23308c7d363e973efc220b8981e5b615b86a0e0d70d3e0192b42ab88d5"
    end
    on_intel do
      url "https://github.com/pkarpovich/turtle-harbor/releases/download/v0.3.0/turtle-harbor-x86_64-apple-darwin.tar.gz"
      sha256 "84941ca000ba5fb3a32a48a4bc14a5a0d1d96b8631eac0aa7ebfc0a294757377"
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
