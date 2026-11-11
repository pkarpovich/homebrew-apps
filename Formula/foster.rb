class Foster < Formula
  desc "Process registry with PTY attach for long-running commands"
  homepage "https://github.com/pkarpovich/foster"
  version "0.3.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/pkarpovich/foster/releases/download/v0.3.0/foster-aarch64-apple-darwin.tar.gz"
      sha256 "f28f76afe589c00059423074c0004327c9430547491da50d0c9fba07fa9b2a08"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/pkarpovich/foster/releases/download/v0.3.0/foster-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f678a69df7b70f90c47bdd177f2fcdb6429986d6e0f76ae04ed2fe953f5d4ec9"
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
