# Application Blueprint

## Overview

This document outlines the plan to refactor the application to implement a login-based dashboard system. The user will first need to log in to access the application. Once authenticated, the user will be presented with a dashboard with a side menu for navigation.

## Style, Design, and Features

*   **Authentication:**
    *   Login screen with email and password fields.
    *   Secure token-based authentication.
    *   Persistent login sessions with auto-login.
*   **Dashboard:**
    *   Displays a side menu for navigation.
    *   The main content area will show the selected dashboard or grid.
*   **Navigation:**
    *   Side menu with a list of available grids.
    *   The user can switch between different grids.

## Real Backend Integration

The application has been integrated with a real backend API. The following changes were made:

1.  **Dependencies:**
    *   Added the `http` package for making HTTP requests to the backend.
    *   Added the `flutter_secure_storage` package for securely storing the authentication token.

2.  **Authentication Service (`lib/auth/auth_service.dart`):**
    *   The `login` method was updated to send a `POST` request to the `/get-token` endpoint of the backend API.
    *   Upon successful authentication, the API token is stored securely using `flutter_secure_storage`.
    *   The `logout` method was updated to delete the token from secure storage.
    *   The `tryAutoLogin` method was added to check for a stored token when the app starts, enabling persistent login sessions.

3. **Dashboard Service (`lib/models/dashboard_service.dart`):**
    *   Created a service to fetch dashboard data from the backend.
    *   The `getDashboards` method sends a `GET` request to the `/dashboards` endpoint and now expects a list of dashboards.

4.  **Main Application (`lib/main.dart`):**
    *   The `main` function was updated to initialize the `AuthService` and call `tryAutoLogin` before the app runs. This ensures that the user's session is restored if they have previously logged in.

## Provider Refactoring

The provider architecture has been refactored for better state management and data flow.

1.  **`DashboardProvider` (`lib/providers/dashboard_provider.dart`):**
    *   This provider is now responsible for both fetching the dashboard data and managing the selected grid.
    *   The `loadDashboards` method fetches data using the `DashboardService`.
    *   The `selectGrid` method updates the currently selected grid.

2.  **Removed `AppProvider`:**
    *   The `AppProvider` was removed to eliminate redundant state management and consolidate dashboard-related logic into the `DashboardProvider`.

## Multiple Dashboard Support

The application now supports multiple dashboards.

1.  **Dashboard Selection Screen (`lib/screens/dashboard_selection_screen.dart`):**
    *   If the backend returns more than one dashboard, this screen is displayed, allowing the user to select a dashboard.

2.  **`AuthGate` Update:**
    *   The `AuthGate` now checks the number of dashboards after login and navigates to the `DashboardSelectionScreen` if there is more than one dashboard, or directly to the `HomeScreen` if there is only one.

3.  **`DashboardProvider` Update:**
    *   The provider now manages a list of dashboards and a `selectedDashboard`.

## Code Consolidation and Conflict Resolution

A critical issue was identified where duplicate files for authentication and the login screen were causing runtime conflicts. This led to the application using outdated code, resulting in login failures despite the backend URL being correctly configured in the settings.

The following steps were taken to resolve this:

1.  **File Consolidation:**
    *   The content of the outdated `lib/login_screen.dart` was merged into the correct `lib/screens/login_screen.dart` to preserve the most recent UI and logic.
2.  **Duplicate File Removal:**
    *   The redundant `lib/login_screen.dart` was deleted.
    *   The redundant `lib/auth_service.dart` was deleted to ensure only the version in `lib/auth/auth_service.dart` is used.
3.  **Import Path Correction:**
    *   The file `lib/services/api_service.dart` was referencing the deleted `auth_service.dart`. Its import path was updated to `package:organiseyou/auth/auth_service.dart`.
4.  **Verification:**
    *   A full project analysis (`flutter analyze`) was performed to confirm that all conflicts were resolved and the codebase is clean.

This cleanup ensures that the application now consistently uses a single, correct source for authentication logic and UI, resolving the login failures and improving the overall stability and maintainability of the project.

## Improved State Management for Instant Navigation

An issue was identified where the UI would "freeze" or become unresponsive after selecting a dashboard. This was caused by `await`ing a network call for the grid data before navigating, which blocked the UI thread.

*   **Problem:** An initial attempt to fix a race condition involved `await`ing the `selectDashboard` method, which included a network request. This locked the UI, creating a poor user experience.

*   **Solution:** The state management logic was refactored to ensure instant navigation while data loads in the background.
    1.  **Synchronous State Update:** The `selectDashboard` method in `DashboardProvider` was changed to be synchronous (`void`). It now immediately sets the `_selectedDashboard` and notifies listeners. This allows the UI to update instantly with the new dashboard information (like the `SideMenu`).
    2.  **Background Data Fetching:** After the initial synchronous update, `selectDashboard` then calls the `async` `selectGrid` method *without* awaiting it. This triggers the network request for the grid data in the background.
    3.  **Responsive UI:** The `onTap` handler in `DashboardSelectionScreen` was reverted to a simple synchronous navigation call. The result is that the user is navigated to the `HomeScreen` instantly. The `SideMenu` appears immediately, and the main content area shows a loading indicator until the background grid data fetch is complete.

This two-part change provides a smooth, responsive user experience, eliminating both the original race condition and the subsequent UI freeze.

## Plan

1.  **Authentication:**
    *   Create a `lib/auth` directory.
    *   Create a `lib/auth/auth_service.dart` to handle user authentication (login/logout).
    *   Create a `lib/auth/auth_gate.dart` to manage the authentication state and redirect users accordingly.

2.  **Data Models:**
    *   Create a `lib/models` directory.
    *   Create a `lib/models/dashboard.dart` to represent the dashboard object.
    *   Create a `lib/models/grid.dart` for the grid object.
    *   Create a `lib/models/dashboard_service.dart` to handle fetching dashboard data.

3.  **Providers:**
    *   Create a `lib/providers` directory.
    *   Create a `lib/providers/dashboard_provider.dart` to manage the application state, including fetching dashboards and the selected grid.

4.  **Screens:**
    *   Create a `lib/screens` directory.
    *   Create a `lib/screens/login_screen.dart` for the user login UI.
    *   Create a `lib/screens/home_screen.dart` to display the main dashboard content.
    *   Create a `lib/screens/dashboard_selection_screen.dart` to allow the user to select a dashboard.

5.  **Widgets:**
    *   Create a `lib/widgets` directory.
    *   Create a `lib/widgets/side_menu.dart` to display the navigation with the list of grids for the selected dashboard.

6.  **Main:**
    *   Update `lib/main.dart` to use the `AuthGate` and the new `DashboardProvider`.

7.  **Testing:**
    *   Update `test/widget_test.dart` to reflect the new application structure and functionality.
