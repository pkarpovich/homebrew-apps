class Ovq < Formula
  desc "Query Obsidian vault files by frontmatter properties"
  homepage "https://github.com/pkarpovich/ovq"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pkarpovich/ovq/releases/download/v0.1.0/ovq-aarch64-apple-darwin.tar.gz"
      sha256 "d4d877dadb3654e60906714e19c1df03364a1fe70d0ad3127677d331627d881c"
    end
    on_intel do
      url "https://github.com/pkarpovich/ovq/releases/download/v0.1.0/ovq-x86_64-apple-darwin.tar.gz"
      sha256 "3a1d6e48c1277c559c949717c4782fc2e2dea52ca5b179810e69865a51f6e733"
    end
  end

  def install
    bin.install "ovq"
  end

  test do
    assert_match "ovq", shell_output("\#{bin}/ovq --help")
  end
end
