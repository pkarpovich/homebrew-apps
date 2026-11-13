class Ferry < Formula
  desc "Call named handlers on another host over one ssh stream"
  homepage "https://github.com/pkarpovich/ferry"
  version "0.1.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/pkarpovich/ferry/releases/download/v0.1.0/ferry-aarch64-apple-darwin.tar.gz"
      sha256 "06f811ba216cc60e0f4d0890eacfb7c7095594fac7fa9319b7fa60b45b73c286"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/pkarpovich/ferry/releases/download/v0.1.0/ferry-x86_64-unknown-linux-musl.tar.gz"
      sha256 "900b51f2d779e60749077722eb8c9cce5cd1263cbbd2ba16bdddb53e92862313"
    end
  end

  def install
    bin.install "ferry"
  end

  service do
    run macos: [opt_bin/"ferry", "daemon"]
    keep_alive true
    environment_variables PATH: std_service_path_env
    log_path var/"log/ferry.log"
    error_log_path var/"log/ferry.log"
  end

  test do
    assert_match "usage: ferry", shell_output("#{bin}/ferry help")
  end
end
