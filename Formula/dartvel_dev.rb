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
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.5.0/dartvel-darwin-arm64"
      sha256 "559cefcc6c5b83cebf0297656bd47e9606210e95ad679a0f54172a616f860f29"
    end
    on_intel do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.5.0/dartvel-darwin-amd64"
      sha256 "85836eeb7997121103ae96dd831e4b41fd8585bebd085182ab35fc798ed5d082"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.5.0/dartvel-linux-arm64"
      sha256 "7dbb0c0a195a196fd0ee7e75146e3fa5c84eca26e075ff942e00091dbcb97c8f"
    end
    on_intel do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.5.0/dartvel-linux-amd64"
      sha256 "81099130045728fe62459f2317b5da508fe54199183282c334d835a797a7cbdf"
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
