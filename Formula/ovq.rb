class Ovq < Formula
  desc "Query Obsidian vault files by frontmatter properties"
  homepage "https://github.com/pkarpovich/ovq"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pkarpovich/ovq/releases/download/v0.3.0/ovq-aarch64-apple-darwin.tar.gz"
      sha256 "a2b5328b95a4c1343cc88d77201f491489db803e6cb72d0302e0fe5760ce74fb"
    end
    on_intel do
      url "https://github.com/pkarpovich/ovq/releases/download/v0.3.0/ovq-x86_64-apple-darwin.tar.gz"
      sha256 "f777d547ae72c06399d568f93bc13ebaba40e1e03a2d32601ff770b2aed5a630"
    end
  end

  def install
    bin.install "ovq"
  end

  test do
    assert_match "ovq", shell_output("\#{bin}/ovq --help")
  end
end
