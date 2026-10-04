class Ovq < Formula
  desc "Query Obsidian vault files by frontmatter properties"
  homepage "https://github.com/pkarpovich/ovq"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pkarpovich/ovq/releases/download/v0.3.1/ovq-aarch64-apple-darwin.tar.gz"
      sha256 "68fd270542226f00f80a54820703a55b26248213e29acf3f4e9128b57f77262b"
    end
    on_intel do
      url "https://github.com/pkarpovich/ovq/releases/download/v0.3.1/ovq-x86_64-apple-darwin.tar.gz"
      sha256 "17ffa84dc3fc2723053b133758026cd9577bb7b20b7e4fca42a9107226300dde"
    end
  end

  def install
    bin.install "ovq"
  end

  test do
    assert_match "ovq", shell_output("\#{bin}/ovq --help")
  end
end
