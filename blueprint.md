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
