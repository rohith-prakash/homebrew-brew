require "language/node"

class TwilioAT104 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://rohith-prakash.github.io/test/twilio-v1.0.4/twilio-v1.0.4.tar.gz"
  version "1.0.4"
  sha256 "6b27c5672620895bb12530728e394dab15895621f15997c6631bb6a3759771f4"
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
