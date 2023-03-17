# Clean Todo

This is a mobile app built with Flutter that does X, Y, and Z.

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

## Localization

Our app is localized into multiple languages. You can learn more about how to use localization in our [Localization Documentation](./docs/localization.md).

## Testing

We have a suite of unit and integration tests to ensure the quality of our app. You can learn more about testing in our [Testing Documentation](./docs/testing.md).

## Deployment

We use Code Magic for continuous integration and deployment. You can learn more about how to deploy our app using Code Magic in our [Deployment Documentation](./docs/deployment.md).

## Troubleshooting

If you run into any issues while developing or using our app, check out our [Troubleshooting Documentation](./docs/troubleshooting.md) for some common solutions and tips.

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.
