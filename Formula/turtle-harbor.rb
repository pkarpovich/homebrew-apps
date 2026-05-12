class TurtleHarbor < Formula
  desc "Script manager daemon with auto-restart and cron scheduling"
  homepage "https://github.com/pkarpovich/turtle-harbor"
  version "0.6.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pkarpovich/turtle-harbor/releases/download/v0.6.3/turtle-harbor-aarch64-apple-darwin.tar.gz"
      sha256 "3b9a9a68acd325082f407b8ef1f66136bafeeb34d42ff258a681321c2dd62921"
    end
    on_intel do
      url "https://github.com/pkarpovich/turtle-harbor/releases/download/v0.6.3/turtle-harbor-x86_64-apple-darwin.tar.gz"
      sha256 "61f173934a9ce6bd29f2699e5a4a0ba7f5f30e02ea1bbad41887a07e3ff30563"
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
