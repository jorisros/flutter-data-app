# Application Blueprint

## Overview

This document outlines the plan to refactor the application to implement a login-based dashboard system. The user will first need to log in to access the application. Once authenticated, the user will be presented with a dashboard with a side menu for navigation.

## Plan

1.  **Authentication:**
    *   Create a `lib/auth` directory.
    *   Create a `lib/auth/auth_service.dart` to handle user authentication (login/logout).
    *   Create a `lib/auth/auth_gate.dart` to manage the authentication state and redirect users accordingly.

2.  **Data Models:**
    *   Create a `lib/models` directory.
    *   Create a `lib/models/dashboard.dart` to represent the dashboard object.
    *   Create a `lib/models/grid.dart` for the grid object.

3.  **Providers:**
    *   Create a `lib/providers` directory.
    *   Create a `lib/providers/app_provider.dart` to manage the application state, including the selected dashboard and grid.

4.  **Screens:**
    *   Create a `lib/screens` directory.
    *   Create a `lib/screens/login_screen.dart` for the user login UI.
    *   Create a `lib:wq
/screens/home_screen.dart` to display the main dashboard content.

5.  **Widgets:**
    *   Create a `lib/widgets` directory.
    *   Create a `lib/widgets/side_menu.dart` to display the navigation with the list of grids.

6.  **Main:**
    *   Update `lib/main.dart` to use the `AuthGate` and the new providers.

7.  **Testing:**
    *   Update `test/widget_test.dart` to reflect the new application structure and functionality.
