class RalphexMacosRunner < Formula
  desc "Native macOS runner daemon for ralphex-farm"
  homepage "https://github.com/pkarpovich/ralphex-macos-runner"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/pkarpovich/ralphex-macos-runner/releases/download/v0.4.0/ralphex-macos-runner-aarch64-apple-darwin.tar.gz"
      sha256 "bcd42f1647e85142ae0b02877deb771d1a1f6d92b0b28c3a264802eb7fd0366e"
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

      It signs in to the authorization server with its own RSA key. Set
      key_file to that key and keep it readable by you only (chmod 600).
    CAVEATS
  end

  test do
    assert_match "rxd", shell_output("#{bin}/rxd --help")
  end
end
