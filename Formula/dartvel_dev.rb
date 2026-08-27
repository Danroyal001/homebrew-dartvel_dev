# Dartvel — a batteries-included, AI-native full-stack platform built around
# Flutter.
#
# The formula, the pub.dev package and the npm package are all named
# `dartvel_dev`; the command is `dartvel`. They differ because `dartvel` was
# taken on pub.dev on 2026-08-06 by an unrelated package, so the published
# identifier carries the suffix and the thing you type does not.
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
      sha256 :no_check
    end
    on_intel do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.2.1/dartvel-darwin-amd64"
      sha256 :no_check
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.2.1/dartvel-linux-arm64"
      sha256 :no_check
    end
    on_intel do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.2.1/dartvel-linux-amd64"
      sha256 :no_check
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
