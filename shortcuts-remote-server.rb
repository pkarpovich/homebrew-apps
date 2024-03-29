# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class ShortcutsRemoteServer < Formula
  desc ""
  homepage "https://github.com/pkarpovich/shortcuts-remote-server"
  version "1.1.2"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pkarpovich/shortcuts-remote-server/releases/download/v1.1.2/shortcuts-remote-server_1.1.2_darwin_arm64.tar.gz"
      sha256 "5323efe52c06b3421814fdbc27b9170a51c7958156d1f02c29ce87e96a816e11"

      def install
        bin.install "shortcuts-remote-server"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/pkarpovich/shortcuts-remote-server/releases/download/v1.1.2/shortcuts-remote-server_1.1.2_darwin_amd64.tar.gz"
      sha256 "57e68352017f9dba492d75ace421b1dad2c5e18b7528a66885ab367efa74bc98"

      def install
        bin.install "shortcuts-remote-server"
      end
    end
  end
end
