# Canonical Homebrew formula template for aish.
#
# This file is the source of truth. The release workflow renders it (filling in
# the version and per-platform SHA256s) and pushes the result to
# byteink/homebrew-tap as Formula/aish.rb. The placeholders below are replaced
# by scripts/render-formula.ts; do not hand-edit them.
class Aish < Formula
  desc "AI shell assistant that turns natural language into shell commands"
  homepage "https://github.com/byteink/aish"
  version "0.2.0"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/byteink/aish/releases/download/v0.2.0/aish_Darwin_arm64.tar.gz"
      sha256 "42152be581e1a2387e9cf41dfdfa4f3ad5df1c84a7546f4215eb3dabee8bf970"
    end
    on_intel do
      url "https://github.com/byteink/aish/releases/download/v0.2.0/aish_Darwin_x86_64.tar.gz"
      sha256 "dcdfe64fcfef9464a2815924dde6341fb7b1eaffb26c377331bc91a0b5d330cc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/byteink/aish/releases/download/v0.2.0/aish_Linux_x86_64.tar.gz"
      sha256 "4aa5ded7f08d3404a19361d84f3841007e9ef6bf97a1ec0afd00cdeaf60bf445"
    end
  end

  def install
    bin.install "ai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai --version")
  end
end
