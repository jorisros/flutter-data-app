# Flutter Data App

This is a Flutter application that demonstrates how to build a data-driven app with a dynamic UI.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Prerequisites

To run this project locally, you will need the following installed on your machine:

- **Flutter SDK:** Follow the instructions on the [Flutter website](https://docs.flutter.dev/get-started/install) to install the Flutter SDK.
- **Xcode:** Install Xcode from the Mac App Store. This will also install the necessary command-line tools.
- **An IDE:** You can use Android Studio, VS Code with the Flutter extension, or any other editor of your choice.

## Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/jorisros/flutter-data-app.git
    ```
2.  **Navigate to the project directory:**
    ```bash
    cd flutter-data-app
    ```
3.  **Get the dependencies:**
    ```bash
    flutter pub get
    ```

## Running the Application

You can run the application on the web, on an Android emulator or device, or as a native macOS application.

### Web

To run the application in a web browser, use the following command:

```bash
flutter run -d chrome
```

### Android

To run the application on an Android emulator or a connected Android device, use the following command:

```bash
flutter run -d android
```

### iOS

To run the application on the iOS Simulator, first, make sure a simulator is running. You can start a simulator from Xcode.

Then, use the following command:

```bash
flutter run -d ios
```

If you get a "No devices found" error, or if you have multiple simulators and want to target a specific one, you can run the following command to get a list of available devices and their IDs:

```bash
flutter devices
```

This will output a list of devices. Find the ID of the simulator you want to use, for example:

```
Found 3 connected devices:
  iPhone SE (3rd generation) (mobile) • 0A718408-9774-4EBD-89C6-0E4379F3D4BF • ios • com.apple.CoreSimulator.SimRuntime.iOS-17-5 (simulator)
  macOS (desktop)                     • macos                                • darwin-arm64   • macOS 26.1 25B78 darwin-arm64
  Chrome (web)                        • chrome                               • web-javascript • Google Chrome 142.0.7444.162
```

Then, use the device ID with the `-d` flag to run the app on that specific simulator:

```bash
flutter run -d 0A718408-9774-4EBD-89C6-0E4379F3D4BF
```
This is particularly useful in cloud-based IDEs where the default device detection might not work as expected.

### macOS

To run the application as a native macOS desktop app, use the following command:

```bash
flutter run -d macos
```
