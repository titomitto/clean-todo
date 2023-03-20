# Tasks feature
The tasks feature allows users to manage their to-do list by creating, reading, updating, and deleting tasks.

## Data Layer
The data layer is responsible for providing the source of the tasks data. It includes the following classes:

- `TasksLocalDataSource`: an interface defining the local data source contract for tasks.
- `TasksLocalDataSourceImpl`: an implementation of `TasksLocalDataSource` using Hive as the underlying data store.
## Domain Layer
The domain layer is responsible for defining the business logic and use cases related to tasks. It includes the following classes:

- `Task`: a data class representing a task.
- `TaskRepository`: an interface defining the repository contract for tasks.
- `GetTasksUseCase`: a use case that retrieves a list of tasks.
- `AddTaskUseCase`: a use case that adds a new task.
- `UpdateTaskUseCase`: a use case that updates an existing task.
- `DeleteTaskUseCase`: a use case that deletes an existing task.
## Presentation Layer
The presentation layer is responsible for handling the UI logic and user interactions related to tasks. It includes the following classes:

- `TasksController`: a controller that manages state of the tasks and exposes the tasks data to the UI.
- `TasksScreen`: a screen that displays the tasks UI.
- `AddTaskScreen`: a screen that allows users to add a new task.


## Dependencies
The tasks feature depends on the following external libraries:

- `Riverpod`: a state management library used to manage the tasks state.
- `Hive`: a lightweight and fast key-value database used to store tasks data locally.
## Usage
To use the tasks feature in your app, you need to:

- Define the Task data class.
- Implement the TasksLocalDataSource interface using TasksLocalDataSourceImpl.
- Implement the TaskRepository interface using TaskRepositoryImpl.
- Define the GetTasksUseCase, AddTaskUseCase, UpdateTaskUseCase, and DeleteTaskUseCase use cases using the TaskRepository interface.
- Define the TasksViewModel view model using the GetTasksUseCase, AddTaskUseCase, UpdateTaskUseCase, and DeleteTaskUseCase use cases.
- Define the TasksPage, AddTaskPage, and UpdateTaskPage UI pages using the TasksViewModel view model.
- Use Riverpod to manage the tasks state and inject the TasksViewModel view model into the UI pages.
- Use Hive to store tasks data locally using TasksLocalDataSourceImpl.
That's it! You should now be able to use the tasks feature in your app.