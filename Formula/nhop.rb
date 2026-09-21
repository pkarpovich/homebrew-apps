class Nhop < Formula
  desc "Rule-based local proxy router for macOS"
  homepage "https://github.com/pkarpovich/nhop"
  version "0.1.6"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/pkarpovich/nhop/releases/download/v0.1.6/nhop-aarch64-apple-darwin.tar.gz"
  sha256 "f8e2de810d9e75e1092dc52fcba8dad73bfefc39429bf8b8c11676b60adda5f9"

  def install
    bin.install "nhop"
  end

  # Homebrew writes and loads the LaunchAgent itself, so the program path
  # is always the installed one and there is no placeholder to substitute.
  service do
    run [opt_bin/"nhop", "start"]
    # Homebrew's generated plist carries no PATH, so the daemon would
    # inherit launchd's minimal one and an init script whose shebang
    # resolves an interpreter through env would fail to start.
    environment_variables PATH: std_service_path_env
    keep_alive true
    log_path var/"log/nhop.log"
    error_log_path var/"log/nhop.err.log"
  end

  def caveats
    <<~CAVEATS
      Start the daemon and point macOS at it:

        brew services start nhop
        sudo nhop proxy on

      macOS asks for Local Network access the first time the daemon dials
      the upstream. Until it is granted the upstream reads as unreachable
      with "No route to host" - nhop doctor says so and names the remedy.

      Rules live in ~/.config/nhop/init. Without that file every connection
      is direct.

      If you already load a hand-written dev.pkarpovich.nhop.plist,
      remove it first: two daemons cannot both bind 7890.
    CAVEATS
  end

  test do
    assert_match "rule-based local proxy router", shell_output("#{bin}/nhop --help")
  end
end
