class Bruq < Formula
  desc "Convert Bruno .bru files to curl commands"
  homepage "https://github.com/pkarpovich/bruq"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pkarpovich/bruq/releases/download/v0.1.1/bruq-aarch64-apple-darwin.tar.gz"
      sha256 "8d989b71af7fa99b27ca12502f727301e2a4196a726a500de1798dcb98dad905"
    end
    on_intel do
      url "https://github.com/pkarpovich/bruq/releases/download/v0.1.1/bruq-x86_64-apple-darwin.tar.gz"
      sha256 "93c1a91cfd83493b9d492d479f995c03dd6c0b67f74d5397969a9c58067458c3"
    end
  end

  def install
    bin.install "bruq"
  end

  test do
    assert_match "bruq", shell_output("\#{bin}/bruq --help")
  end
end
