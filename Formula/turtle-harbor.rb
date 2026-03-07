class TurtleHarbor < Formula
  desc "Script manager daemon with auto-restart and cron scheduling"
  homepage "https://github.com/pkarpovich/turtle-harbor"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pkarpovich/turtle-harbor/releases/download/v0.6.1/turtle-harbor-aarch64-apple-darwin.tar.gz"
      sha256 "41736319c73dbb7668d98b72f6112f008c272fd90686b1f5ddfee41790f12291"
    end
    on_intel do
      url "https://github.com/pkarpovich/turtle-harbor/releases/download/v0.6.1/turtle-harbor-x86_64-apple-darwin.tar.gz"
      sha256 "cd3fe3839454b8160ad83d07dcda65b61bed5736d94a9147dbb2aae45f9b0950"
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
