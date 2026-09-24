class RalphexMacosRunner < Formula
  desc "Native macOS runner daemon for ralphex-farm"
  homepage "https://github.com/pkarpovich/ralphex-macos-runner"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/pkarpovich/ralphex-macos-runner/releases/download/v0.3.0/ralphex-macos-runner-aarch64-apple-darwin.tar.gz"
      sha256 "6ce91cbb17dbe7f9fcb895f14737afe91f78f9b49def332e95c7018f5214067c"
    end
  end

  def install
    bin.install "ralphex-macos-runner"
    bin.install "rxd"
  end

  def caveats
    <<~CAVEATS
      Register the LaunchAgent after installing, and again after every upgrade:

        rxd install

      The daemon reads its configuration from:

        ~/Library/Application Support/ralphex-macos-runner/config.toml
    CAVEATS
  end

  test do
    assert_match "rxd", shell_output("#{bin}/rxd --help")
  end
end
