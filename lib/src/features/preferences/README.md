# Preferences feature
The Preferences feature allows users to customize the theme mode and language of the app. The user's choices are saved locally and can be accessed across the app.
## Architecture
The Preferences feature allows users to customize the theme mode and language of the app. It follows the clean architecture, with the following layers:

- `Domain`: Contains the business logic and use cases for managing preferences.
- `Data`: Contains the repository and data source for fetching and persisting preference data.
- `Presentation`: Contains the UI components and the controller that manages the state of the UI.
## Domain Layer
The domain layer is responsible for defining the business logic and use cases related to preferences. It includes the following classes:

### Entities
- `Preferences`: a data class representing a user's preference for theme mode and language.
### Repositories
- `PreferencesRepository`: an interface defining the repository contract for preferences.
### Use cases
- `GetPreferences`: a use case that retrieves the user's preference for theme mode and language.
- `SetThemeMode`: a use case that updates the user's preference for theme mode.
- `SetLanguage`: a use case that updates the user's preference for language.
### Data Layer
The data layer is responsible for providing the source of the preference data. It includes the following classes:

- `PreferencesLocalDataSource`: an interface defining the local data source contract for preferences.
- `PreferencesLocalDataSourceImpl`: an implementation of `PreferencesLocalDataSource` using Hive as the underlying data store.
## Presentation Layer
The presentation layer is responsible for handling the UI logic and user interactions related to preferences. It includes the following classes:

### Controllers
- `PreferencesController`: a controller that manages state of the preferences and exposes the preference data to the UI.
### Screens
- `PreferencesScreen`: a screen that displays the preference UI.
## Dependencies
The preferences feature depends on the following external libraries:

- `Riverpod`: a state management library used to manage the preference state.
- `Hive`: a lightweight and fast key-value database used to store preference data locally.
## Testing
The preferences feature has the following tests:

Unit tests for the use cases in the domain layer.
Integration tests for the repository and data source in the data layer.
## Known Issues
None at the moment.