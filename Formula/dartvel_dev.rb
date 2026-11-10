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
  version "0.13.33"
  license "MIT"

  # The release workflow that built macOS binaries cannot run now (GitHub Actions
  # is unavailable on this account), so releases since 0.5.0 ship Linux binaries
  # only. Saying so here beats handing a Mac the 0.5.0 binary under a newer name.
  depends_on :linux

  on_linux do
    on_arm do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.13.33/dartvel-linux-arm64"
      sha256 "11a206002c9a52ad6d99c806cd749e7a9a4431824e2b9407f5eec6390e5c9c53"
    end
    on_intel do
      url "https://github.com/Danroyal001/dartvel_dev/releases/download/v0.13.33/dartvel-linux-amd64"
      sha256 "d08f3e58be4820b0245208b9c0d644b924e42eddf6451cd45c0d478cd7214fc5"
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
