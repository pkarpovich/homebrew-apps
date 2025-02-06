# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class TurtleHarbor < Formula
  desc "Script manager daemon for macOS"
  homepage "https://github.com/pkarpovich/turtle-harbor"
  version "0.1.0"
  depends_on :macos

  if Hardware::CPU.intel?
    url "https://github.com/pkarpovich/turtle-harbor/releases/download/v0.1.0/turtle-harbor_0.1.0_darwin_amd64.tar.gz"
    sha256 "a11a2a89803f458d6c7ca7c20bde651f9fd8a913275fcb8c4652f6819344be63"

    def install
      bin.install "th"
      bin.install "turtled"
      (var/"lib/turtle-harbor").mkpath
      (var/"log/turtle-harbor").mkpath
    end
  end
  if Hardware::CPU.arm?
    url "https://github.com/pkarpovich/turtle-harbor/releases/download/v0.1.0/turtle-harbor_0.1.0_darwin_arm64.tar.gz"
    sha256 "5057c80298e11e9e4d457fb2e2eeef7be5502936099081186e256f2cbb6e1fb6"

    def install
      bin.install "th"
      bin.install "turtled"
      (var/"lib/turtle-harbor").mkpath
      (var/"log/turtle-harbor").mkpath
    end
  end

  service do
    run [opt_bin/"turtled"]
    keep_alive true
    working_dir var/"lib/turtle-harbor"
    log_path var/"log/turtle-harbor/daemon.log"
    error_log_path var/"log/turtle-harbor/daemon.error.lo
  end
end
