# Canonical Homebrew formula template for aish.
#
# This file is the source of truth. The release workflow renders it (filling in
# the version and per-platform SHA256s) and pushes the result to
# byteink/homebrew-tap as Formula/aish.rb. The placeholders below are replaced
# by scripts/render-formula.ts; do not hand-edit them.
class Aish < Formula
  desc "AI shell assistant that turns natural language into shell commands"
  homepage "https://github.com/byteink/aish"
  version "0.3.0"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/byteink/aish/releases/download/v0.3.0/aish_Darwin_arm64.tar.gz"
      sha256 "c6a463453c3811f6a857e264c8936a4880b04a1b4f117dc8e7624a6aabcceb82"
    end
    on_intel do
      url "https://github.com/byteink/aish/releases/download/v0.3.0/aish_Darwin_x86_64.tar.gz"
      sha256 "c7f84d56d2635ca3f2b5c42bda0feced1cf3f8011021163e6fda657669211add"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/byteink/aish/releases/download/v0.3.0/aish_Linux_x86_64.tar.gz"
      sha256 "bf6acfd18f2c7b386eabc57a568fe4b4c0af68b013e00d267d18b9ab828a55e7"
    end
  end

  def install
    bin.install "ai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai --version")
  end
end
