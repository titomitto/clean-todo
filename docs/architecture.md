# Architecture Documentation
## Overview
This document provides an overview of the architecture of our Flutter app using clean architecture. Our goal is to ensure that our app is scalable, maintainable, and testable, and that it adheres to industry best practices.

## Architecture
Our app follows a clean architecture pattern, which consists of the following layers:

- Presentation Layer: This layer is responsible for displaying the UI of our app and handling user input. We use Flutter widgets and Riverpod for state management in this layer.

- Domain Layer: This layer is responsible for defining the business logic of our app. It contains the use cases, entities, and repositories that define the core functionality of our app. We use the Dartz library for functional programming in this layer.

- Data Layer: This layer is responsible for providing data to the domain layer. It contains the data sources, repositories, and models that handle data fetching and storage. We use the Dio library for HTTP requests and the Hive library for local data storage in this layer.

## Folders
Our app is organized into the following folders:

- config: This folder contains configuration files and constants that are used throughout our app, such as API endpoints and app themes.

- core: This folder contains the core functionality of our app, such as error handling and dependency injection.

- eatures: This folder contains the features of our app, such as tasks and preferences. Each feature has its own folder with the three sub-folders: presentation, domain, and data.

## Features
Our app has the following features:

1. Tasks: This feature allows users to create and manage tasks. It includes the following functionality:
- Displaying a list of tasks
- Creating a new task
- Updating an existing task
- Marking a task as completed
- Deleting a task
2. Preferences: This feature allows users to customize their app preferences. It includes the following functionality:
Displaying a form for updating preferences
- Saving the updated preferences
- For more detailed documentation on each feature, please refer to the individual feature documentation.

Conclusion
By following the clean architecture pattern, we can ensure that our app is well-organized, maintainable, and testable. Our app's features are organized into their own folders, making it easy to add new features or modify existing ones. The architecture documentation provides a high-level overview of the app's structure and serves as a guide for developers who are working on the app.