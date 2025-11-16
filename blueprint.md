# Flutter Data App

## Overview

This is a Flutter application that demonstrates how to build a data-driven app with a dynamic UI. The goal is to create a solid foundation for a Flutter project that can be easily extended and customized.

## Style, Design, and Features

### Authentication

*   **Login Screen:** A screen with email and password fields for user authentication.
*   **Secure Token Storage:** The authentication token is securely stored on the device using `flutter_secure_storage`.
*   **Authentication State Management:** The `provider` package is used to manage the user's authentication state throughout the app.
*   **Conditional Navigation:** The app shows the login screen if the user is not authenticated, and the home screen if they are.

## Current Task: Implement Login Functionality

### Plan

1.  **Add Dependencies:** Add `http` for API calls and `flutter_secure_storage` for secure token storage.
2.  **Create Authentication Service:** Create a service to handle authentication against the provided Swagger API.
3.  **Create Login Screen:** Build a UI for the login screen.
4.  **Manage Authentication State:** Use `provider` to manage the user's authentication state.
5.  **Conditional Navigation:** Implement logic to show the login screen or home screen based on the authentication state.
6.  **Add Logout Button:** Add a logout button to the home screen.

## Previous Task: Initial Project Setup

### Plan

1.  **Initialize Git Repository:** Set up the project as a Git repository.
2.  **Add Remote Origin:** Connect the local repository to a private GitHub repository.
3.  **Address Missing `ssh-keygen`:** Add `openssh` to the development environment to ensure `ssh-keygen` is available.
4.  **Update README:** Rewrite the `README.md` file with clear instructions on how to run the project locally on macOS.
5.  **Create Blueprint:** Create this `blueprint.md` file to document the project's progress.
