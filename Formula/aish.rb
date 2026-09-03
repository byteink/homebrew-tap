# Canonical Homebrew formula template for aish.
#
# This file is the source of truth. The release workflow renders it (filling in
# the version and per-platform SHA256s) and pushes the result to
# byteink/homebrew-tap as Formula/aish.rb. The placeholders below are replaced
# by scripts/render-formula.ts; do not hand-edit them.
class Aish < Formula
  desc "AI shell assistant that turns natural language into shell commands"
  homepage "https://github.com/byteink/aish"
  version "0.3.2"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/byteink/aish/releases/download/v0.3.2/aish_Darwin_arm64.tar.gz"
      sha256 "5ec1d675ee6b5b85feb9cc0c357c0c310708809ab31e91d381a1c0f2c539c394"
    end
    on_intel do
      url "https://github.com/byteink/aish/releases/download/v0.3.2/aish_Darwin_x86_64.tar.gz"
      sha256 "293c37f3a64ca34bf3da0b4c735b5e0ee5fa582c339e8e3f79c26922310f28ac"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/byteink/aish/releases/download/v0.3.2/aish_Linux_x86_64.tar.gz"
      sha256 "bcf2c9f9ee6dc1380f4d1e7e7f458ef551a48231142c914138361491961dc749"
    end
  end

  def install
    bin.install "ai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai --version")
  end
end
