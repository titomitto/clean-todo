# Architecture Documentation
## Overview
This document provides an overview of the architecture of Clean Todo using clean architecture. My goal is to ensure that this app is scalable, maintainable, and testable, and that it adheres to industry best practices.

## Architecture
This app follows the [clean architecture](https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/) pattern, which consists of the following layers:

- Presentation Layer: This layer is responsible for displaying the UI of this app and handling user input. I use Flutter widgets and [Riverpod](https://riverpod.dev/) for state management in this layer.

- Domain Layer: This layer is responsible for defining the business logic of this app. It contains the use cases, entities, and repositories that define the core functionality of this app. I use the Dartz library for functional programming in this layer.

- Data Layer: This layer is responsible for providing data to the domain layer. It contains the data sources, repositories, and models that handle data fetching and storage. I use the Dio library for HTTP requests and the Hive library for local data storage in this layer.

## Folders
Our app is organized into the following folders:

- config: This folder contains configuration files and constants that are used throughout this app, such as API endpoints and app themes.

- core: This folder contains the core functionality of this app, such as error handling and dependency injection.

- features: This folder contains the features of this app, such as tasks and preferences. Each feature has its own logic within the three sub-folders: presentation, domain, and data.

## Features
Our app has the following features:

1. Tasks: This feature allows users to create and manage tasks. It includes the following functionality:
- Displaying a list of tasks
- Creating a new task
- Updating an existing task
- Marking a task as completed
- Deleting a task
2. Preferences: This feature allows users to customize their app preferences. It includes the following functionality:
- Saving the updated preferences eg. Language and Theme
- For more detailed documentation on each feature, please refer to the individual feature documentation.