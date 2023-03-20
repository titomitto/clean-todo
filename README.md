# Clean Todo

Todo App following clean architecture and best coding practices

## Architecture

This app follows the principles of Clean Architecture and is structured into the following layers:

- `config`: Contains configuration files and utilities for setting up the app and its dependencies.
- `core`: Contains common functionality and abstractions used throughout the app.
- `features`: Contains the main features of the app, each with its own set of `data`, `domain`, and `presentation` layers. 

The `data` layer contains models, data sources and repositories for retrieving and storing data related to the feature. 
The `domain` layer contains entities, use cases, and repository interfaces for defining the business logic of the feature. 
The `presentation` layer contains the UI layer and widgets for displaying and interacting with the feature, as well as any state management code with Riverpod.

For more information on how the app is structured and organized, see the [architecture documentation](./docs/architecture.md).



## Features

### Preferences

Allows users to customize the app's settings and preferences.

For more information on how the preferences feature is structured and implemented, see the [preferences documentation](./docs/preferences_feature.md).

### Tasks

Allows users to create, manage, and complete tasks.

For more information on how the tasks feature is structured and implemented, see the [tasks documentation](./docs/tasks_feature.md).

## Getting Started

To run the app locally, follow these steps:

1. Clone this repository.
2. Open the project in Android Studio or VS Code.
3. Run the app using a simulator or connected device.

For more detailed instructions, see the [Flutter documentation](https://flutter.dev/docs/get-started/install).

## Contributing

If you would like to contribute to this project, please follow these guidelines:

- Fork the repository and create a new branch.
- Make changes and test them thoroughly.
- Submit a pull request with a detailed description of your changes.

For more information on how to contribute, see the [contributing guidelines](./CONTRIBUTING.md).

## Internationalization
The all features supports internationalization using the `AppLocalizations` class provided by the Flutter Internationalization package. All the strings used are defined in the `AppLocalizations` class and can be translated into different languages, just add another file in `l10n` folder. For more you can refer to [this](https://docs.flutter.dev/development/accessibility-and-localization/internationalization) flutter documentation.
## Others

- [Localization](./docs/localization.md)
- [Testing](./docs/testing.md)
- [Troubleshooting](./docs/troubleshooting.md)
## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.
