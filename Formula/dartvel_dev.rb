# Dartvel — a batteries-included, AI-native full-stack platform built around
# Flutter.
#
# The formula, the pub.dev package and the npm package are all named
# `dartvel_dev`; the command is `dartvel`. They differ because `dartvel` was
# taken on pub.dev on 2026-08-06 by an unrelated package, so the published
# identifier carries the suffix and the thing you type does not.
#
# The checksums are the ones published with the release, so Homebrew refuses a
# download that does not match rather than installing whatever arrived. They
# were :no_check until the release existed to take them from.
#
# This installs a prebuilt binary rather than building from source. The CLI is
# a Dart program, but `dart build cli` links the Dart runtime and the Rust
# server library into a single executable, so there is nothing to depend on at
# run time -- no Dart, no Flutter, no cellar full of pub cache.
#
# Building an application still needs Flutter, for whichever target you are
# building. Running the CLI does not, which is why this formula has no
# dependencies at all.
class DartvelDev < Formula
  desc "Batteries-included, AI-native full-stack application platform for Flutter"
  homepage "https://dartvel.dev"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.3.0/dartvel-darwin-arm64"
      sha256 "f0dcc5f3463963d9147b85d7253bbf332f790ff1e5d39d7ddd8f704e2fa9a5d0"
    end
    on_intel do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.3.0/dartvel-darwin-amd64"
      sha256 "a9a6b5f00e3dc41ff8916ca08ed7e24583c3eb007b06a7114628a3edd424233e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.3.0/dartvel-linux-arm64"
      sha256 "13429db633cebeda6d070ad12c885af2c91b2c89cfb3e97247653b28429ce275"
    end
    on_intel do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.3.0/dartvel-linux-amd64"
      sha256 "e692161d4250704af8d15cd6fb68f1247480716d2340c861f064967dcc9b5413"
    end
  end

  def install
    # The download arrives under the asset name; the command is `dartvel`.
    bin.install Dir["dartvel-*"].first => "dartvel"
  end

  test do
    # Asserts the binary runs and reports a version, not that a file landed in
    # bin. A formula checking only for the file passes when the binary cannot
    # start at all.
    assert_match "Dartvel CLI", shell_output("#{bin}/dartvel --version")
  end
end
