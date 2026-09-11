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
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.4.1/dartvel-darwin-arm64"
      sha256 "154737724c273ddd01fb97ce1daa58f3be7a2348f513c7c1afbccde5fc7afa9c"
    end
    on_intel do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.4.1/dartvel-darwin-amd64"
      sha256 "9967690966811e9b45897ac0a6d0a402abf69b5950e6b67f279983690ab8af25"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.4.1/dartvel-linux-arm64"
      sha256 "cef42ce74da3996c0651450eaffd313c0fbae2444e59c911d26b8c5535ce6d6a"
    end
    on_intel do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.4.1/dartvel-linux-amd64"
      sha256 "04bba97f62ea4d13b6e47dbd71dd0fd1ede76d31acdc8eb443e0e78e63227d8d"
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
