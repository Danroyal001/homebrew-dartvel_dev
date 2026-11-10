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
  version "0.13.35"
  license "MIT"

  # The release workflow that built macOS binaries cannot run now (GitHub Actions
  # is unavailable on this account), so releases since 0.5.0 ship Linux binaries
  # only. Saying so here beats handing a Mac the 0.5.0 binary under a newer name.
  depends_on :linux

  on_linux do
    on_arm do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.13.35/dartvel-linux-arm64"
      sha256 "7832b7759d1482f134628b1a78d37d7a508760ebccbf7a888a0a4b2e8d6de6d8"
    end
    on_intel do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.13.35/dartvel-linux-amd64"
      sha256 "c4ded0418d7d048c383da2ceced2842c3624d3d70203f02ba354eb79b47fd15c"
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
