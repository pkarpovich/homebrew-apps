class Foster < Formula
  desc "Process registry with PTY attach for long-running commands"
  homepage "https://github.com/pkarpovich/foster"
  url "https://github.com/pkarpovich/foster/releases/download/v0.1.0/foster-aarch64-apple-darwin.tar.gz"
  sha256 "33345f3cbf327c97474228ac4641f059fd0a7be8dae357539ecbc098a996603d"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "foster", "foster-zmx"
    prefix.install "LICENSE-zmx"
  end

  test do
    assert_match "foster restore", shell_output("#{bin}/foster help")
  end
end
