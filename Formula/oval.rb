class Oval < Formula
  desc "Command-line tools for the Oval voting guide format"
  homepage "https://oval.vote"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/oval-vote/oval/releases/download/v0.1.8/oval-0.1.8-aarch64-apple-darwin.tar.gz"
      sha256 "6433ad3b125181ad7b0afc4ba90f1991fd7c53e4caaad2b01a8e3bde889da81e"
    end
    on_intel do
      url "https://github.com/oval-vote/oval/releases/download/v0.1.8/oval-0.1.8-x86_64-apple-darwin.tar.gz"
      sha256 "8c1dfdf2f1d1edd639d4d3c1b4b284c0f7d50b6689e73e8730863da335dbea53"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/oval-vote/oval/releases/download/v0.1.8/oval-0.1.8-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a6bd00bbcd4c1f4556d473355b20b69ed5b292aee200e4b2b8b6ee7208c6e36c"
    end
    on_intel do
      url "https://github.com/oval-vote/oval/releases/download/v0.1.8/oval-0.1.8-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6628438571dafb984c3d9e747e6492b9bb1189a62ca51f397cd03a606fd5da28"
    end
  end

  def install
    bin.install "oval"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/oval --version")
    (testpath/"guide.oval").write <<~OVAL
      oval 1
      guide "G"
      election "E"
      date 2026-11-03
      ballot @b "B"
        measure @m "M"
          recommend yes
    OVAL
    system bin/"oval", "check", testpath/"guide.oval"
  end
end
