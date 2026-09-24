class RalphexMacosRunner < Formula
  desc "Native macOS runner daemon for ralphex-farm"
  homepage "https://github.com/pkarpovich/ralphex-macos-runner"
  version "0.3.1"

  on_macos do
    on_arm do
      url "https://github.com/pkarpovich/ralphex-macos-runner/releases/download/v0.3.1/ralphex-macos-runner-aarch64-apple-darwin.tar.gz"
      sha256 "ffbbdb943c54d0045ae7a4a661097469bf3cb5069b0966139101d66086a4db90"
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
