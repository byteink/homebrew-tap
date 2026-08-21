# Canonical Homebrew formula template for aish.
#
# This file is the source of truth. The release workflow renders it (filling in
# the version and per-platform SHA256s) and pushes the result to
# byteink/homebrew-tap as Formula/aish.rb. The placeholders below are replaced
# by scripts/render-formula.ts; do not hand-edit them.
class Aish < Formula
  desc "AI shell assistant that turns natural language into shell commands"
  homepage "https://github.com/byteink/aish"
  version "0.3.1"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/byteink/aish/releases/download/v0.3.1/aish_Darwin_arm64.tar.gz"
      sha256 "8e82e31961c74dc2b8a2039990f4efc6f2be4b643f511240d770a0556e4b72dd"
    end
    on_intel do
      url "https://github.com/byteink/aish/releases/download/v0.3.1/aish_Darwin_x86_64.tar.gz"
      sha256 "6ffd60931c7021a4ff5d193d6b0fb970c823d99469627e6812a1ddd16658185b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/byteink/aish/releases/download/v0.3.1/aish_Linux_x86_64.tar.gz"
      sha256 "b6dac3086a466ad14458504f13672f4588247145e30d9d6c5a21894a48b41c36"
    end
  end

  def install
    bin.install "ai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai --version")
  end
end
