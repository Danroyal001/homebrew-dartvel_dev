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
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.2.1/dartvel-darwin-arm64"
      sha256 "317cd485e09240fb194d9dc6b17fff8023f775666ea42bddcdc122ab0f46d772"
    end
    on_intel do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.2.1/dartvel-darwin-amd64"
      sha256 "0b51da8db76dd366e9418e07773cd0df7b5ff821f62039855db04324b49608e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.2.1/dartvel-linux-arm64"
      sha256 "7194173da013d06d2999185611548fb8d91bc1e6804a1b843fbe77ea4faaf5b5"
    end
    on_intel do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.2.1/dartvel-linux-amd64"
      sha256 "9a4e689428e3a9e8c535e469e5d7e9dc70f1f29239f1d36bd690506fecdc8a5b"
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
