class TurtleHarbor < Formula
  desc "Script manager daemon with auto-restart and cron scheduling"
  homepage "https://github.com/pkarpovich/turtle-harbor"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pkarpovich/turtle-harbor/releases/download/v0.5.0/turtle-harbor-aarch64-apple-darwin.tar.gz"
      sha256 "36bc3c301f6de0fcf289b6e6e57df3627b05471cb845f423b63b131636d76901"
    end
    on_intel do
      url "https://github.com/pkarpovich/turtle-harbor/releases/download/v0.5.0/turtle-harbor-x86_64-apple-darwin.tar.gz"
      sha256 "d0c19f50f0c3172fd9f6bdc4b0eb28779c2ec670d6e5cbbe744c8e2f1abd4ade"
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
