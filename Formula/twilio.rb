require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v2.27.1/twilio-v2.27.1.tar.gz"
  version 2.27.1
  sha256 53ba96e10642570ba12bb869e9fbfc1bbcfc67ddf97c78c14a1bf3014d8f2b83
  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/twilio"
  end

  def post_install
    pid = spawn("node #{libexec}/welcome.js")
    Process.wait pid
  end
end
