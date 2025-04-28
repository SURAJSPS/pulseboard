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

Anomaly Detection System

This project implements a sophisticated anomaly scoring algorithm for sensor data with visual status indicators.

Calculation Methodology

1. Normal Operating Ranges

Parameter	Ideal Range	Acceptable Range	Absolute Range
Temperature	22-40°C	0-100°C	0-100°C
Humidity	45-60% RH	0-100% RH	0-100% RH
Pressure	1013±20 hPa	900-1100 hPa	900-1100 hPa
2. Individual Anomaly Calculation

For each parameter, we calculate deviation percentage from ideal range:

Temperature (T)

math
\text{Anomaly} = 
\begin{cases} 
\frac{22 - T}{22} \times 100\% & \text{if } T < 22°C \\
\frac{T - 40}{60} \times 100\% & \text{if } T > 40°C \\
0\% & \text{if } 22°C \leq T \leq 40°C
\end{cases}
Humidity (H)

math
\text{Anomaly} = 
\begin{cases} 
\frac{45 - H}{45} \times 100\% & \text{if } H < 45\% \\
\frac{H - 60}{40} \times 100\% & \text{if } H > 60\% \\
0\% & \text{if } 45\% \leq H \leq 60\%
\end{cases}
Pressure (P)

math
\text{Anomaly} = 
\begin{cases} 
\frac{993 - P}{93} \times 100\% & \text{if } P < 993\text{hPa} \\
\frac{P - 1033}{67} \times 100\% & \text{if } P > 1033\text{hPa} \\
0\% & \text{if } 993\text{hPa} \leq P \leq 1033\text{hPa}
\end{cases}
3. Combined Anomaly Score

We use a weighted average approach:

math
\text{Total Anomaly} = (0.5 \times T_{\text{anom}}) + (0.3 \times H_{\text{anom}}) + (0.2 \times P_{\text{anom}})
4. Status Classification

Anomaly %	Color	Status	Visual Indicator
0%	Green	Normal	●
1-50%	Yellow	Warning	▲
51-100%	Red	Critical	■
-1/null	Gray	Offline	◌
Example Calculation

Given:

Temperature: 45°C (8.33% anomaly)
Humidity: 70% (25% anomaly)
Pressure: 980 hPa (13.98% anomaly)
Weighted Calculation:

(0.5 × 8.33) + (0.3 × 25) + (0.2 × 13.98) = 13.9%
Result: Yellow warning status (13.9%)

Implementation Notes

Edge Cases:
Values beyond absolute ranges are capped at 100% anomaly
Offline sensors (null values) bypass calculations and show gray
Customization:
Adjust weights in AnomalyCalculator.dart
Modify ranges in sensor_constants.dart
Visualization:
dart
AnomalyIndicator(
  value: calculateAnomaly(sensor),
  size: 20.0,
)
For algorithm details, see: lib/domain/anomaly_calculation.dart

This format provides:

Clear mathematical notation
Visual status reference
Implementation details
Example calculation
Code location pointers


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
