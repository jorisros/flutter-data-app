# Organiseyou App Blueprint

## Overview

A dynamic data-driven application that loads and renders dashboards from a backend. The UI is built dynamically based on the configuration received from a dashboard endpoint.

## Features

*   **Dynamic UI:** The application will fetch a dashboard configuration from a backend and render the UI accordingly.
*   **Data Tables:** It will be able to display data in tables.
*   **Theme Toggle:** Users can switch between light and dark themes.
*   **Modern UI:** A clean and intuitive user interface using Material Design 3.

## Implemented

*   **Project Cleanup:**
    *   Removed the existing todo-specific files (`todo.dart`, `todo_provider.dart`).
*   **Add Dependencies:**
    *   Added the `http` package for making network requests.
*   **Data Modeling:**
    *   Created models to represent the dynamic dashboard structure (e.g., `Dashboard`, `Widget`, `DataTable`).
*   **Backend Integration:**
    *   Created a `DashboardProvider` to fetch the dashboard configuration from a mocked backend endpoint.
*   **UI Implementation:**
    *   Created a `DashboardScreen` that dynamically builds widgets based on the fetched data.
    *   Implemented a `DataTableWidget` to display tabular data.
