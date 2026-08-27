# Dartvel Homebrew tap

```sh
brew install Danroyal001/dartvel_dev/dartvel_dev
dartvel --help
```

The formula, the [pub.dev package](https://pub.dev/packages/dartvel_dev) and
the [npm package](https://www.npmjs.com/package/dartvel_dev) are all named
`dartvel_dev`. The command is `dartvel`.

Those differ on purpose. `dartvel` on pub.dev was taken on 2026-08-06 by an
unrelated package, so the published identifier carries a suffix while the thing
you type does not.

## What it installs

Dartvel is a Dart toolchain, so this tap does not vendor a compiled binary. The
formula installs the CLI through `dart pub global activate` into its own cellar,
which keeps Homebrew and pub from disagreeing about which build is current.

Dart is the only dependency. Flutter is not, because the CLI needs the Dart SDK
alone — and building against Flutter would pull several gigabytes onto machines
that already have it.
