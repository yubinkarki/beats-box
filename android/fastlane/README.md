fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## Android

### android clean

```sh
[bundle exec] fastlane android clean
```

Gradle and Flutter clean

### android set_versions

```sh
[bundle exec] fastlane android set_versions
```

Set version name and build number

### android distribute_to_firebase

```sh
[bundle exec] fastlane android distribute_to_firebase
```

Generic function to use firebase_app_distribution plugin

### android release

```sh
[bundle exec] fastlane android release
```

Release build on Firebase

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
