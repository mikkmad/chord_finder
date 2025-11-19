# Chord Finder

## Overview
**Chord Finder** is a desktop application that brings a simplified, offline version of [all-guitar-chords.com](https://www.all-guitar-chords.com/) to your fingertips. With Chord Finder, users can easily explore guitar chords, scales, and chord progressions without needing an internet connection.

## Features
- **Find All Chords**: Discover all guitar chords and their variations.
- **Visualized Fretboard**: Identify chords by selecting notes on a virtual fretboard.
- **Scales and Patterns**: View various scales, their patterns, and individual blocks (all, multiple, or single blocks).
- **Chord Progressions**: Access predefined chord progressions for each chord (e.g., I-VI-IV, I-IV-ii-VI).

## How to Build & Run the Application

### 1. **Clone the Repository**
```sh 
git clone [https://github.com/mikkmad/Chord_Finder.git](https://github.com/mikkmad/Chord_Finder.git) 
```

### 2. **Open in your IDE**
Open the project in your preferred flutter-compatible IDE (e.g., Visual Studio Code, Android Studio).

### 3. **Run the Application**
Use the IDE's run feature to launch the application on your desktop. **Make sure to select a build target**.

> [!WARNING] 
> For MacOS or iOS development, ensure you are on a Mac with Xcode installed. 

> [!TIP] 
> **In Visual Studio Code**, you can select the target from the bottom-right corner of the window.
> 
> **In Android Studio**, you can select the target from the device dropdown in the toolbar. 

### 4. **Build for Release**
Follow Flutter's official documentation to build the application for your target desktop platform:

| Platform | Documentation Link |
| ---: | :--- |
| **MacOS** | https://docs.flutter.dev/deployment/macos |
| **iOS** | https://docs.flutter.dev/deployment/ios |
| **Windows** | https://docs.flutter.dev/deployment/windows |
| **Linux** | https://docs.flutter.dev/deployment/linux |
| **Android** | https://docs.flutter.dev/deployment/android |
| **Web** | https://docs.flutter.dev/deployment/web |

For example:
```sh
flutter build macos    # For macOS
flutter build ios      # For iOS
flutter build windows  # For Windows
flutter build linux    # For Linux
flutter build apk      # For Android
flutter build web      # For Web - no specific build modes available
```
To see all supported build targets on your system, run:
```sh
flutter help build
```
This command lists `Available subcommands`, which indicate the supported platforms. For more details on build modes, refer to: https://docs.flutter.dev/testing/build-modes.
