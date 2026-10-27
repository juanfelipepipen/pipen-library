# Project

This repository contains Pipen, a reusable Dart/Flutter library published to pub.dev.

# Publishing

When the user asks to publish (for example, "publicar"), carry out the release workflow:

1. Review the changes and run the checks relevant to the release.
2. Bump the version in `pubspec.yaml` using semantic versioning appropriate to the changes.
3. Add an entry to `CHANGELOG.md` for that version describing the changes.
4. Commit the release changes, including `pubspec.yaml` and `CHANGELOG.md`.
5. Run `dart pub publish` and verify the result.

A request to publish authorizes the version bump, changelog update, commit, and publication. Do not stop after preparing the release files.
