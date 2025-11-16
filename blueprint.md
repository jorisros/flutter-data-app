
# Blueprint: Dynamic Data Application

## Overview

This document outlines the plan for building a dynamic data-driven Flutter application. The application will render UI components, such as grids and forms, based on a JSON configuration file. This approach allows for a flexible and extensible application where the UI and data models can be updated without changing the core application code.

## Features

*   **Dynamic UI Generation**: The application will read a JSON file to dynamically create data grids and forms.
*   **Side Menu Navigation**: The main navigation will be a side menu (drawer) that is populated based on the "location" property in the JSON configuration.
*   **Data-Driven Views**: The grids and forms will be connected to data models defined in the JSON.
*   **Extensible Architecture**: The application will be built with a modular and extensible architecture to easily accommodate new UI elements and data types in the future.

## Plan

1.  **Setup & Configuration**:
    *   Store the provided JSON configuration in `assets/app_config.json`.
    *   Add necessary dependencies (`provider`, `json_annotation`, `build_runner`, `json_serializable`).
    *   Update `pubspec.yaml` to include the assets directory.

2.  **Data Modeling**:
    *   Create Dart classes that mirror the JSON structure in a new `lib/models` directory.
    *   Use the `json_serializable` package to automate the creation of `fromJson` and `toJson` methods.
    *   Run `build_runner` to generate the necessary serialization code.

3.  **Application Architecture**:
    *   Use the `provider` package for state management. An `AppProvider` will be created to hold the application's state, including the parsed JSON configuration.
    *   Create a `JsonService` to load and parse the `app_config.json` file.
    *   Update `lib/main.dart` to initialize the `AppProvider` and set up the main application structure.

4.  **UI Implementation**:
    *   **Main Layout**: A `Scaffold` with a `Drawer` for the side menu and a body to display the selected content.
    *   **Side Menu**: A dynamic menu built from the `grid` objects in the JSON. It will support nested items based on the `location` property.
    *   **Grid View**: A widget that dynamically displays a data grid based on the selected menu item. It will show columns and data as defined in the JSON.
    *   **Form View**: (Future Step) A widget that dynamically generates a form for creating and editing data.

