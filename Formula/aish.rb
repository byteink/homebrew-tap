# Canonical Homebrew formula template for aish.
#
# This file is the source of truth. The release workflow renders it (filling in
# the version and per-platform SHA256s) and pushes the result to
# byteink/homebrew-tap as Formula/aish.rb. The placeholders below are replaced
# by scripts/render-formula.ts; do not hand-edit them.
class Aish < Formula
  desc "AI shell assistant that turns natural language into shell commands"
  homepage "https://github.com/byteink/aish"
  version "0.3.3"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/byteink/aish/releases/download/v0.3.3/aish_Darwin_arm64.tar.gz"
      sha256 "e7dbce3a3900e43a91438c2b0902afdbb96765e8a3c5cfe4e5d906167a930e52"
    end
    on_intel do
      url "https://github.com/byteink/aish/releases/download/v0.3.3/aish_Darwin_x86_64.tar.gz"
      sha256 "14b5778b543b0f60cabcebbf423cf2ede1d77c613f33412ffcc36ca9c8e61dd2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/byteink/aish/releases/download/v0.3.3/aish_Linux_x86_64.tar.gz"
      sha256 "4cb80d1f246c5d21494acd1b89a74b8d40f86958af40ad3bc10f618d7889b856"
    end
  end

  def install
    bin.install "ai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai --version")
  end
end
