class Foster < Formula
  desc "Process registry with PTY attach for long-running commands"
  homepage "https://github.com/pkarpovich/foster"
  version "0.1.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/pkarpovich/foster/releases/download/v0.1.1/foster-aarch64-apple-darwin.tar.gz"
      sha256 "3c302c0c7888cd6e51a1bf966db685a26336950be22f6b45e0563dc4bd98fc23"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/pkarpovich/foster/releases/download/v0.1.1/foster-x86_64-unknown-linux-musl.tar.gz"
      sha256 "29e5da6be944de361cb08de0722deade85c92e07f5e46d878515bf629b1519c0"
    end
  end

  def install
    bin.install "foster", "foster-zmx"
    prefix.install "LICENSE-zmx"
  end

  test do
    assert_match "foster restore", shell_output("#{bin}/foster help")
  end
end
