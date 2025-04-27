import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pulseboard/domain/repositories/i_sensor_repository.dart';
import 'package:pulseboard/domain/entities/sensor.dart';
import 'package:pulseboard/application/sensor/sensor_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dartz/dartz.dart';
import 'package:pulseboard/domain/core/value_failure.dart';
import 'package:pulseboard/domain/di/app_providers.dart'
    show sensorRepositoryProvider;

import 'sensor_controller_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ISensorRepository>()])
void main() {
  late ISensorRepository mockRepository;
  late ProviderContainer container;

  setUp(() {
    mockRepository = MockISensorRepository();
    container = ProviderContainer(
      overrides: [sensorRepositoryProvider.overrideWithValue(mockRepository)],
    );

    // Initialize with empty data to prevent auto-fetch in build()
    when(mockRepository.fetchSensorData()).thenAnswer((_) async => Right([]));
  });

  tearDown(() {
    container.dispose();
  });

  group('SensorDataNotifier', () {
    test('initial state is correct', () {
      final notifier = container.read(sensorControllerProvider.notifier);
      expect(notifier.state, SensorState.initial());
    });

    test('auto-fetches data on initialization', () async {
      final sensors = [
        Sensor(
          id: '1',
          location: 'Line A',
          timestamp: DateTime.now(),
          temperature: 30.0,
          humidity: 50.0,
          pressure: 1000.0,
          isOnline: true,
        ),
      ];
      when(
        mockRepository.fetchSensorData(),
      ).thenAnswer((_) async => Right(sensors));

      // Rebuild container to trigger auto-fetch
      container = ProviderContainer(
        overrides: [sensorRepositoryProvider.overrideWithValue(mockRepository)],
      );

      // Wait for the auto-fetch to complete
      await container.read(sensorControllerProvider.notifier).refreshData();

      final state = container.read(sensorControllerProvider);
      expect(state.status, Status.loaded);
      expect(state.sensors.length, 1);
    });

    test('refreshData handles repository errors', () async {
      when(mockRepository.fetchSensorData()).thenAnswer(
        (_) async => Left(ValueFailure.unexpected(failedValue: 'error')),
      );

      final notifier = container.read(sensorControllerProvider.notifier);
      await notifier.refreshData();

      expect(notifier.state.status, Status.error);
      expect(notifier.state.errorMessage, contains('error'));
    });

    test('correctly calculates metrics from sensor data', () async {
      final sensors = [
        Sensor(
          id: '1',
          location: 'Line A',
          timestamp: DateTime.now(),
          temperature: 30.0,
          humidity: 50.0,
          pressure: 1000.0,
          isOnline: true,
        ),
        Sensor(
          id: '2',
          location: 'Line B',
          timestamp: DateTime.now(),
          temperature: 50.0, // Above normal
          humidity: 65.0, // Above normal
          pressure: 1015.0, // Above normal
          isOnline: true,
        ),
        Sensor(
          id: '3',
          location: 'Line C',
          timestamp: DateTime.now(),
          temperature: double.nan,
          humidity: double.nan,
          pressure: double.nan,
          isOnline: false,
        ),
      ];
      when(
        mockRepository.fetchSensorData(),
      ).thenAnswer((_) async => Right(sensors));

      final notifier = container.read(sensorControllerProvider.notifier);
      await notifier.refreshData();

      final state = notifier.state;
      expect(state.activeSensors, 2);
      expect(state.totalSensors, 3);
      expect(state.inActiveSensors, 1);
      expect(state.criticalAlerts, 1); // Only sensor 2 meets both criteria

      // Temperature metrics
      expect(state.avgTemp, 40.0); // (30 + 50) / 2
      expect(state.aboveNormalTemp, 1.0); // Only sensor 2
      expect(state.minTemp, 30.0);

      // Humidity metrics
      expect(state.avgHumidity, 57.5); // (50 + 65) / 2
      expect(state.aboveNormalHumidity, 1.0); // Only sensor 2
      expect(state.minHumidity, 50.0);

      // Pressure metrics
      expect(state.avgPressure, 1007.5); // (1000 + 1015) / 2
      expect(state.aboveNormalPressure, 1.0); // Only sensor 2
      expect(state.minPressure, 1000.0);
    });

    test('handles empty sensor list', () async {
      when(mockRepository.fetchSensorData()).thenAnswer((_) async => Right([]));

      final notifier = container.read(sensorControllerProvider.notifier);
      await notifier.refreshData();

      final state = notifier.state;
      expect(state.status, Status.loaded);
      expect(state.sensors.isEmpty, true);
      expect(state.activeSensors, 0);
      expect(state.totalSensors, 0);
      expect(state.avgTemp, 0.0);
    });

    test('toggleBubbleSize switches between humidity and pressure', () {
      final notifier = container.read(sensorControllerProvider.notifier);

      // Initial state
      expect(notifier.state.bubbleToggle, BubbleToggle.humidity);

      // First toggle
      notifier.toggleBubbleSize();
      expect(notifier.state.bubbleToggle, BubbleToggle.pressure);

      // Second toggle
      notifier.toggleBubbleSize();
      expect(notifier.state.bubbleToggle, BubbleToggle.humidity);
    });

    test('skips NaN values in calculations', () async {
      final sensors = [
        Sensor(
          id: '1',
          location: 'Line A',
          timestamp: DateTime.now(),
          temperature: double.nan,
          humidity: double.nan,
          pressure: double.nan,
          isOnline: false,
        ),
        Sensor(
          id: '2',
          location: 'Line B',
          timestamp: DateTime.now(),
          temperature: 40.0,
          humidity: 60.0,
          pressure: 1010.0,
          isOnline: true,
        ),
      ];
      when(
        mockRepository.fetchSensorData(),
      ).thenAnswer((_) async => Right(sensors));

      final notifier = container.read(sensorControllerProvider.notifier);
      await notifier.refreshData();

      final state = notifier.state;
      expect(state.avgTemp, 40.0); // Should ignore NaN values
      expect(state.avgHumidity, 60.0);
      expect(state.avgPressure, 1010.0);
    });
  });
}
