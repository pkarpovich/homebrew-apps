class Foster < Formula
  desc "Process registry with PTY attach for long-running commands"
  homepage "https://github.com/pkarpovich/foster"
  version "0.2.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/pkarpovich/foster/releases/download/v0.2.1/foster-aarch64-apple-darwin.tar.gz"
      sha256 "0266ce62305177c29c1bcf448853a2827d75f13d74211d7daa15e78d696d5de7"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/pkarpovich/foster/releases/download/v0.2.1/foster-x86_64-unknown-linux-musl.tar.gz"
      sha256 "45c054b116c11ebcac3df88c3c635b96c7f06adb26fc2950d434e5289a2da8f5"
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
