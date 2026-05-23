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
      sha256 "682126faec79e26a52f0a065a311b080f3e14888b8dde2857d308e6c86ed095a"
    end
    on_intel do
      url "https://github.com/byteink/aish/releases/download/v0.1.0/aish_Darwin_x86_64.tar.gz"
      sha256 "8ca6756c9fd60dfa3443961b6f13ec5ca90d65827dec8614f8f8d70f8e03b717"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/byteink/aish/releases/download/v0.1.0/aish_Linux_x86_64.tar.gz"
      sha256 "6538651e9a05ec98ba74e6f687b0cf39fdc5a291eba0e1e903e9585e51a1b3de"
    end
  end

  def install
    bin.install "ai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai --version")
  end
end
