class Foster < Formula
  desc "Process registry with PTY attach for long-running commands"
  homepage "https://github.com/pkarpovich/foster"
  version "0.2.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/pkarpovich/foster/releases/download/v0.2.0/foster-aarch64-apple-darwin.tar.gz"
      sha256 "f1032c58746cb5fbc583a239dd69e8920ab7e02c10311b907b6faca874f81c0e"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/pkarpovich/foster/releases/download/v0.2.0/foster-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d53518ccb4e9d5c4d2c2086227faa755eef5a80dd9ad5b90f39906c452195f11"
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
