require "language/node"

class TwilioAT536 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://rohith-prakash.github.io/test/twilio-v5.3.6/twilio-v5.3.6.tar.gz"
  version "5.3.6"
  sha256 "eb2ada1eff4bc1c51005d2076dbad5c8acda0ae06a705550f5d6b479138944c1"
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
