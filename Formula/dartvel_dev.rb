# Dartvel — a batteries-included, AI-native full-stack platform built around
# Flutter.
#
# This formula installs the `dartvel` command. The formula, the pub.dev package
# and the npm package are all named `dartvel_dev`; the command is `dartvel`.
# They differ because `dartvel` was taken on pub.dev on 2026-08-06 by an
# unrelated package, so the published identifier carries the suffix and the
# thing you type does not.
#
# Dartvel is a Dart toolchain, so this does not vendor a binary. Shipping a
# compiled copy here would mean maintaining a second build that drifts from the
# one `dart pub global activate` installs, and it would need a release per
# platform before the tap could exist at all.
class DartvelDev < Formula
  desc "Batteries-included, AI-native full-stack application platform for Flutter"
  homepage "https://dartvel.dev"
  url "https://github.com/Danroyal001/dartvel_dev/archive/refs/tags/v0.2.1.tar.gz"
  version "0.2.1"
  license "MIT"
  head "https://github.com/Danroyal001/dartvel_dev.git", branch: "main"

  # Dart rather than Flutter: the CLI itself needs only the Dart SDK, and
  # depending on Flutter here would pull several gigabytes onto machines that
  # only ever run `dartvel build web` against an existing install.
  depends_on "dart-lang/dart/dart"

  def install
    # Installed through pub rather than compiled here, so `brew upgrade` and
    # `dart pub global activate` cannot end up disagreeing about which build is
    # current.
    ENV["PUB_CACHE"] = buildpath/"pub-cache"
    system "dart", "pub", "global", "activate", "dartvel_dev", version.to_s

    snapshot = buildpath/"pub-cache/bin/dartvel"
    libexec.install Dir[buildpath/"pub-cache/*"]
    (bin/"dartvel").write <<~SHELL
      #!/bin/bash
      export PUB_CACHE="#{libexec}"
      exec "#{libexec}/bin/dartvel" "$@"
    SHELL
    chmod 0755, bin/"dartvel"
    odie "pub did not produce a dartvel executable" unless snapshot.exist?
  end

  test do
    # Asserts the command runs and reports a version, not merely that a file
    # landed in bin. A formula that only checks for the file passes when the
    # wrapper cannot find its pub cache.
    assert_match version.to_s, shell_output("#{bin}/dartvel --version")
  end
end
