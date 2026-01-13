class Bruq < Formula
  desc "Convert Bruno .bru files to curl commands"
  homepage "https://github.com/pkarpovich/bruq"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pkarpovich/bruq/releases/download/v0.1.0/bruq-aarch64-apple-darwin.tar.gz"
      sha256 "2b05ae289d7a539f8946caf1be60adc5fee4b42ff416af3381e3b890ad4e02ac"
    end
    on_intel do
      url "https://github.com/pkarpovich/bruq/releases/download/v0.1.0/bruq-x86_64-apple-darwin.tar.gz"
      sha256 "394de1c999a87ea02bbf9540246dd5c51f3f6474cf23475fbb33c900b18856ac"
    end
  end

  def install
    bin.install "bruq"
  end

  test do
    assert_match "bruq", shell_output("\#{bin}/bruq --help")
  end
end
