require "language/node"

class TwilioAT107 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://rohith-prakash.github.io/test/twilio-v1.0.7/twilio-v1.0.7.tar.gz"
  version "1.0.7"
  sha256 "7eccec03a793e55cf4ef7c24c4bf82d2b0e697c7b7496924050c5abfd3716a39"
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
