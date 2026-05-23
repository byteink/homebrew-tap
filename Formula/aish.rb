# Canonical Homebrew formula template for aish.
#
# This file is the source of truth. The release workflow renders it (filling in
# the version and per-platform SHA256s) and pushes the result to
# byteink/homebrew-tap as Formula/aish.rb. The placeholders below are replaced
# by scripts/render-formula.ts; do not hand-edit them.
class Aish < Formula
  desc "AI shell assistant that turns natural language into shell commands"
  homepage "https://github.com/byteink/aish"
  version "0.1.0"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/byteink/aish/releases/download/v0.1.0/aish_Darwin_arm64.tar.gz"
      sha256 "16dffdaa056512dc760fb71bcd1a75bb7fe1528e9cb9cd9bf7c4786e2d5ddb0b"
    end
    on_intel do
      url "https://github.com/byteink/aish/releases/download/v0.1.0/aish_Darwin_x86_64.tar.gz"
      sha256 "ccf71451f7646c03fd6425fb12365176c622b1727132466d7162af2e2d374dbc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/byteink/aish/releases/download/v0.1.0/aish_Linux_x86_64.tar.gz"
      sha256 "0a20c11d832c6edf90f7f55b3630f7ecae7708219bf83abddd320d5526c3131f"
    end
  end

  def install
    bin.install "ai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai --version")
  end
end
