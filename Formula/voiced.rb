class Voiced < Formula
  desc "Local OpenAI-compatible voice gateway (STT via whisper.cpp)"
  homepage "https://github.com/byteink/voiced"
  url "https://github.com/byteink/voiced/releases/download/v0.6.2/voiced_Darwin_arm64.tar.gz"
  sha256 "bb1d05b10a6a95ed267317a3137ae419d4280d75b497f48899b54b1473d16baa"
  license "MIT"
  version "0.6.2"

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
