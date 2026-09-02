class TurtleHarbor < Formula
  desc "Script manager daemon with auto-restart and cron scheduling"
  homepage "https://github.com/pkarpovich/turtle-harbor"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pkarpovich/turtle-harbor/releases/download/v0.7.0/turtle-harbor-aarch64-apple-darwin.tar.gz"
      sha256 "f25a34b2a3e1113e0e22229f34e8b6d91c61b74800aeaa8b592db65c98049173"
    end
    on_intel do
      url "https://github.com/pkarpovich/turtle-harbor/releases/download/v0.7.0/turtle-harbor-x86_64-apple-darwin.tar.gz"
      sha256 "0d452aae36ad860b7e2a5633e369a64081fc123debb7316d05387fab3c1719b1"
    end
  end

  def install
    bin.install "th"
    bin.install "turtled"
  end

  def caveats
    "Daemon runs from a fixed path so Full Disk Access survives upgrades; after 'brew upgrade' run 'th install' to refresh the daemon binary (FDA preserved, no re-grant)."
  end

  test do
    assert_match "turtle-harbor", shell_output("\#{bin}/th --help")
  end
end
