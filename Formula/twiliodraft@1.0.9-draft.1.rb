require "language/node"

class TwiliodraftAT109Draft1 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://rohith-prakash.github.io/test/channels/draft/twilio-v1.0.9-draft.1/twilio-v1.0.9-draft.1.tar.gz"
  version "1.0.9-draft.1"
  sha256 "58ac51685c47fac8cdd631427ecc4e7305dca7bafab7802fb76b4939b3998c3b"
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