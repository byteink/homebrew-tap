# Canonical Homebrew formula template for aish.
#
# This file is the source of truth. The release workflow renders it (filling in
# the version and per-platform SHA256s) and pushes the result to
# byteink/homebrew-tap as Formula/aish.rb. The placeholders below are replaced
# by scripts/render-formula.ts; do not hand-edit them.
class Aish < Formula
  desc "AI shell assistant that turns natural language into shell commands"
  homepage "https://github.com/byteink/aish"
  version "0.3.4"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/byteink/aish/releases/download/v0.3.4/aish_Darwin_arm64.tar.gz"
      sha256 "f49161fdc449f9853ab7215273525ca69586acaa41adf62fed69d0206d42aa67"
    end
    on_intel do
      url "https://github.com/byteink/aish/releases/download/v0.3.4/aish_Darwin_x86_64.tar.gz"
      sha256 "62ff684c6c0d3ff6f10d05ccd56dc9d868ce68956e6882592f167ea29632911b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/byteink/aish/releases/download/v0.3.4/aish_Linux_x86_64.tar.gz"
      sha256 "56746ceac2d7e4231510f9952732fc74cb0c298c7b66d5ff463f0f097f0df2e8"
    end
  end

  def install
    bin.install "ai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai --version")
  end
end
