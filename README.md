# PulseBoard

A Flutter application for managing sensor data with a dashboard interface.

## Project Overview

PulseBoard is a Flutter-based application that provides monitoring and management of sensor data through a dashboard interface. The application follows clean architecture principles and is organized into distinct layers for better maintainability and scalability.

## Project Structure

### Core Layer (`lib/core/`)
- **routes/**: Application navigation and routing configuration
- **utils/**: Common utilities and helper functions

### Domain Layer (`lib/domain/`)
- **entities/**: Core business objects and models
- **repositories/**: Repository interfaces defining data operations
- **di/**: Dependency injection configuration
- **core/**: Domain-specific core functionality

### Application Layer (`lib/application/`)
- **sensor/**: Sensor-related business logic and use cases
- **dashboard/**: Dashboard-specific business logic and use cases

### Presentation Layer (`lib/presentation/`)
- **pages/**: UI screens and widgets

### Data Layer (`lib/data/`)
- **repositories/**: Implementation of domain repositories
- **models/**: Data models and DTOs
- **datasources/**: Data sources and API clients

### Testing (`test/`)
- **unit/**: Unit tests for individual components
- **application/**: Tests for application layer
- **presentation/**: Tests for presentation layer
- **data/**: Tests for data layer

## Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)
- Android Studio / VS Code with Flutter extensions

### Installation
1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the application

## Development Guidelines

- Follow the clean architecture principles
- Write unit tests for new features
- Maintain consistent code style
- Document complex logic and business rules

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Documentation](https://dart.dev/guides)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request
