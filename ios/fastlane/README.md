fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios set_versions

```sh
[bundle exec] fastlane ios set_versions
```

Set version name and build number

### ios distribute_to_firebase

```sh
[bundle exec] fastlane ios distribute_to_firebase
```

Generic function to use firebase_app_distribution plugin

### ios build_ipa

```sh
[bundle exec] fastlane ios build_ipa
```

Run gym to build ipa

### ios release

```sh
[bundle exec] fastlane ios release
```



----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
