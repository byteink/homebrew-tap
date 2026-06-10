class Voiced < Formula
  desc "Local OpenAI-compatible voice gateway (STT via whisper.cpp)"
  homepage "https://github.com/byteink/voiced"
  url "https://github.com/byteink/voiced/releases/download/v0.5.0/voiced_Darwin_arm64.tar.gz"
  sha256 "2885a7ddb187fafaa69bad221effdce48333db3967a881a9d4d4bada99d4400b"
  license "MIT"
  version "0.5.0"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "ffmpeg"
  depends_on "whisper-cpp"

  def install
    bin.install "voiced", "voiced-diarize"
  end

  def caveats
    <<~CAVEATS
      Add a model and start the agent:
        voiced add large-v3-turbo
        voiced start

      The agent installs a launchd plist at
        ~/Library/LaunchAgents/io.byteink.voiced.plist
      and listens on http://127.0.0.1:2022
    CAVEATS
  end

  test do
    system "#{bin}/voiced", "help"
  end
end
