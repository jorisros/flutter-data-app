# Flutter Data App

## Overview

This is a Flutter application that demonstrates how to build a data-driven app with a dynamic UI. The goal is to create a solid foundation for a Flutter project that can be easily extended and customized.

## Style, Design, and Features

### Authentication

*   **Login Screen:** A screen with email and password fields for user authentication.
*   **Secure Token Storage:** The authentication token is securely stored on the device using `flutter_secure_storage`.
*   **Authentication State Management:** The `provider` package is used to manage the user's authentication state throughout the app.
*   **Conditional Navigation:** The app shows the login screen if the user is not authenticated, and the home screen if they are.

### Settings

*   **Settings Screen:** A screen where the user can configure the backend URL.
*   **Persistent Storage:** The backend URL is saved locally on the device using `shared_preferences`.
*   **Settings Access:** The settings screen is accessible from both the login screen and the home screen via a gear icon in the `AppBar`.

## Current Task: Add Settings Access from Login Screen

### Plan

1.  **Add Settings Icon:** Add a gear icon to the `AppBar` of the `LoginScreen`.
2.  **Navigate to Settings:** When the gear icon is tapped, navigate to the `SettingsScreen`.

## Previous Task: Implement Settings Screen

### Plan

1.  **Add `shared_preferences`:** Add the `shared_preferences` package to the project.
2.  **Create a `SettingsService`:** Create a service to manage saving and retrieving the backend URL.
3.  **Update the `AuthService`:** Modify the `AuthService` to use the backend URL from the `SettingsService`.
4.  **Create a `SettingsScreen`:** Build a UI for the settings screen.
5.  **Add Navigation:** Add a settings icon to the `AppBar` of the `HomeScreen` to navigate to the `SettingsScreen`.

## Initial Project Setup

### Plan

1.  **Initialize Git Repository:** Set up the project as a Git repository.
2.  **Add Remote Origin:** Connect the local repository to a private GitHub repository.
3.  **Address Missing `ssh-keygen`:** Add `openssh` to the development environment to ensure `ssh-keygen` is available.
4.  **Update README:** Rewrite the `README.md` file with clear instructions on how to run the project locally on macOS.
5.  **Create Blueprint:** Create this `blueprint.md` file to document the project's progress.
