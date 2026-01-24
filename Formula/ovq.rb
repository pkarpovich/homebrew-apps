class Ovq < Formula
  desc "Query Obsidian vault files by frontmatter properties"
  homepage "https://github.com/pkarpovich/ovq"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pkarpovich/ovq/releases/download/v0.2.0/ovq-aarch64-apple-darwin.tar.gz"
      sha256 "2578d58777e96ae24cc0ee063479f7c77792f971e166fed662343c42aae1605b"
    end
    on_intel do
      url "https://github.com/pkarpovich/ovq/releases/download/v0.2.0/ovq-x86_64-apple-darwin.tar.gz"
      sha256 "60238fce519116280b8347a4b5f5ae659f68c6449919d9378083bcaeb98fbf9b"
    end
  end

  def install
    bin.install "ovq"
  end

  test do
    assert_match "ovq", shell_output("\#{bin}/ovq --help")
  end
end
