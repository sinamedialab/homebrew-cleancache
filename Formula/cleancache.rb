class Cleancache < Formula
  desc "Fast, silent macOS cache and log cleaner for any user (60+ apps supported)"
  homepage "https://github.com/sinamedialab/homebrew-cleancache"
  url "https://github.com/sinamedialab/homebrew-cleancache/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "REPLACE_AFTER_TAGGING"
  license "MIT"
  version "1.0.0"

  def install
    bin.install "cleancache.sh" => "cleancache"
    pkgshare.install "cleancache.conf"
  end

  def caveats
    <<~EOS
      A sample config file has been installed to:
        #{pkgshare}/cleancache.conf

      Copy it to your home directory to customise defaults:
        cp "#{pkgshare}/cleancache.conf" ~/.cleancache.conf

      Usage:
        sudo cleancache              # silent full cleanup
        sudo cleancache -v           # show everything being deleted
        sudo cleancache -i           # choose section by section
        sudo cleancache -v -i        # interactive with verbose output
        cleancache --help            # show all options
    EOS
  end

  test do
    system "#{bin}/cleancache", "--help"
  end
end