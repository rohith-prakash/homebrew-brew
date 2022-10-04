require "language/node"

class TwilioAT520 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://rohith-prakash.github.io/test/twilio-v5.2.0/twilio-v5.2.0.tar.gz"
  version "5.2.0"
  sha256 "6164f1a6d0337e996e7208fe3c81f6361bda4af9093dbb528435ce538e5341bb"
  depends_on "node"

  def install
    inreplace "bin/twilio", /^CLIENT_HOME=/, "export TWILIO_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/twilio"
  end

  def post_install
    pid = spawn("node #{libexec}/welcome.js")
    Process.wait pid
  end
end
