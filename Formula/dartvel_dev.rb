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
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.4.0/dartvel-darwin-arm64"
      sha256 "7f6d5c9165cfa19eb6ff20e424a617c883a3bb0f62be4d8add8091b99eb1c67c"
    end
    on_intel do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.4.0/dartvel-darwin-amd64"
      sha256 "ab1a768f9e748c0c00463d4bd1b36810f143a1a2dc8a3d77aabca17a9f450f3b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.4.0/dartvel-linux-arm64"
      sha256 "4c4b7b9e9b40a366639e7e4e3b5a39df1ac0923c237d1ea3d149598da8343ed9"
    end
    on_intel do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.4.0/dartvel-linux-amd64"
      sha256 "bab5325f35f8275064e5050e6c561b00037ea09105d424796e0916d141c8d73c"
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
