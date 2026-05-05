plugins {
    // this is necessary to avoid the plugins to be loaded multiple times
    // in each subproject's classloader
    alias(libs.plugins.composeHotReload) apply false
    alias(libs.plugins.composeMultiplatform) apply false
    alias(libs.plugins.composeCompiler) apply false
    alias(libs.plugins.kotlinMultiplatform) apply false
}

/*
Reminder for correct versioning:
    Versioning used: MAJOR.MINOR.PATCH
    - PATCH: Small fixes, cleanup, tiny improvements
    - MINOR: New feature or meaningful milestone
    - MAJOR: Initial full release, then breaking changes

 Utils:
    - Versioning: https://semver.org/
    - Changelogs: https://keepachangelog.com/en/1.1.0/
 */

// TODO: update this before committing
version = "0.0.1-alpha"
