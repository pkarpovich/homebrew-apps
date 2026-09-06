class RalphexMacosRunner < Formula
  desc "Native macOS runner daemon for ralphex-farm"
  homepage "https://github.com/pkarpovich/ralphex-macos-runner"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/pkarpovich/ralphex-macos-runner/releases/download/v0.2.0/ralphex-macos-runner-aarch64-apple-darwin.tar.gz"
      sha256 "6d9aeb7051820358bea26786a1ff568c466baf1a69ebe1c7892b5cc78c32a074"
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
