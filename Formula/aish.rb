# Canonical Homebrew formula template for aish.
#
# This file is the source of truth. The release workflow renders it (filling in
# the version and per-platform SHA256s) and pushes the result to
# byteink/homebrew-tap as Formula/aish.rb. The placeholders below are replaced
# by scripts/render-formula.ts; do not hand-edit them.
class Aish < Formula
  desc "AI shell assistant that turns natural language into shell commands"
  homepage "https://github.com/byteink/aish"
  version "0.1.1"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/byteink/aish/releases/download/v0.1.1/aish_Darwin_arm64.tar.gz"
      sha256 "3d93dc6bf721250d044399a954f78d7219eba4d1480f7bece3b9742ee6379eae"
    end
    on_intel do
      url "https://github.com/byteink/aish/releases/download/v0.1.1/aish_Darwin_x86_64.tar.gz"
      sha256 "60d4faad8326a520fcf4a51756a8d99a2b1b63a5f6f63574149a95072101876d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/byteink/aish/releases/download/v0.1.1/aish_Linux_x86_64.tar.gz"
      sha256 "2f4fcebf3cda3274561c73368056f72624af329a852ac468300c3372111120dc"
    end
  end

  def install
    bin.install "ai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai --version")
  end
end
