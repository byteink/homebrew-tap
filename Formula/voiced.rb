class Voiced < Formula
  desc "Local OpenAI-compatible voice gateway (STT via whisper.cpp)"
  homepage "https://github.com/byteink/voiced"
  url "https://github.com/byteink/voiced/releases/download/v0.2.1/voiced_Darwin_arm64.tar.gz"
  sha256 "ea80888356dcaf511790d215658b04ca6dca9f1d13f93ebe7d1cd56d4bee6bd1"
  license "MIT"
  version "0.2.1"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "ffmpeg"
  depends_on "whisper-cpp"

  def install
    bin.install "voiced"
  end

  def caveats
    <<~CAVEATS
      Add a model and start the agent:
        voiced add large-v3-turbo
        voiced start

      The agent installs a launchd plist at
        ~/Library/LaunchAgents/com.user.voiced.plist
      and listens on http://127.0.0.1:2022
    CAVEATS
  end

  test do
    system "#{bin}/voiced", "help"
  end
end
