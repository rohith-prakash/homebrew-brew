require "language/node"

class Twiliodraft < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://rohith-prakash.github.io/test/channels/draft/twilio-v1.0.17-draft.1/twilio-v1.0.17-draft.1.tar.gz"
  version "1.0.17-draft.1"
  sha256 "dd48cb7cff7a42af9fbdf85d5cfd36e5c3c62b08ed4c2e8bcd1de56650a05fc0"
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