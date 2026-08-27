class Nikki < Formula
  desc "macOS activity capture daemon"
  homepage "https://github.com/pkarpovich/nikki"
  version "0.1.0"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/pkarpovich/nikki/releases/download/v0.1.0/nikki-aarch64-apple-darwin.tar.gz"
  sha256 "367aaff4ed6fbed276661b786f38e2400e773e39f960e841677cfad30c6d358b"

  def install
    bin.install "nikki"
  end

  # Homebrew writes and loads the LaunchAgent itself, so launchd is the
  # responsible process for TCC and both grants land on nikki rather
  # than on whatever terminal started it.
  service do
    run [opt_bin/"nikki"]
    keep_alive true
    log_path var/"log/nikki.log"
    error_log_path var/"log/nikki.err.log"
  end

  def caveats
    <<~CAVEATS
      Write ~/.config/nikki/config.toml BEFORE starting the service.
      service_url and device are required and the daemon exits without
      them, which under keep_alive is a restart loop. The full set of
      keys is in the README; the minimum is:

        service_url = "https://nikki.example"
        device = "mbp-21"

        [browser]
        profile = "MBP_21"

      Then:

        nikki --check-config
        brew services start nikki

      Grant Accessibility to nikki in System Settings > Privacy &
      Security. Without it capture continues, but every window title
      and document path is null and records carry degraded: true.

      The first time it reads a browser tab macOS asks for Automation
      access to Dia. Declining is permanent for this binary and the
      only symptom is a -1743 in the log.
    CAVEATS
  end

  test do
    assert_match "nikki captures what happens on this Mac", shell_output("#{bin}/nikki --help")
  end
end
