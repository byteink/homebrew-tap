class Voiced < Formula
  desc "Local OpenAI-compatible voice gateway (STT via whisper.cpp)"
  homepage "https://github.com/byteink/voiced"
  url "https://github.com/byteink/voiced/releases/download/v0.2.3/voiced_Darwin_arm64.tar.gz"
  sha256 "64806e4dc48c803529ec4407a90c65622abf7f96429ee443b15eff14c640e28b"
  license "MIT"
  version "0.2.3"

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
        ~/Library/LaunchAgents/io.byteink.voiced.plist
      and listens on http://127.0.0.1:2022
    CAVEATS
  end

  test do
    system "#{bin}/voiced", "help"
  end
end
