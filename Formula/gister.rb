class Gister < Formula
  homepage "https://github.com/dutchcoders/gister"
  url "https://github.com/dutchcoders/gister/archive/v1.0.0.tar.gz"
  sha256 "fcf65f987af6041e115b830bc38b83c02e33f54c1677c18e00b7fcc950b7abc5"
  head "https://github.com/dutchcoders/gister.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    mkdir_p "src/github.com/dutchcoders/"
    ln_s buildpath, "src/github.com/dutchcoders/gister"

    system "go", "get", "github.com/google/go-github/github"
    system "go", "get", "golang.org/x/oauth2"
    system "go", "get", "gopkg.in/alecthomas/kingpin.v1"
    system "go", "build", "-o", "gister"

    bin.install "gister"
  end

  test do
    system "#{bin}/gister"
  end
end
