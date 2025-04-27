import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulseboard/domain/core/value_failure.dart';
import 'package:pulseboard/domain/entities/sensor.dart';
import 'package:pulseboard/domain/repositories/i_sensor_repository.dart';
import 'package:pulseboard/application/dashboard/sensor_controller.dart';
import 'package:pulseboard/domain/di/app_providers.dart';

import '../../data/datasources/mock/sensor_data_mock_test.dart';
import 'sensor_controller_test.mocks.dart';

@GenerateMocks([ISensorRepository])
void main() {
  late ISensorRepository mockRepository;
  late ProviderContainer container;

  setUp(() {
    mockRepository = MockISensorRepository();
    // Mock the fetchSensorData call to return an empty list
    when(mockRepository.fetchSensorData()).thenAnswer((_) async => Right([]));

    container = ProviderContainer(
      overrides: [sensorRepositoryProvider.overrideWithValue(mockRepository)],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('SensorController Tests', () {
    test('initial state should match SensorState.initial()', () async {
      final controller = container.read(sensorControllerProvider.notifier);
      // Wait for the initial refresh to complete
      await Future.delayed(Duration.zero);

      final state = controller.state;

      // Verify all initial values match SensorState.initial()
      expect(state.sensors, isEmpty);
      expect(state.totalSensors, equals(0));
      expect(state.inActiveSensors, equals(0));
      expect(state.activeSensors, equals(0));
      expect(state.criticalAlerts, equals(0));
      expect(state.avgTemp, equals(0.0));
      expect(state.aboveNormalTemp, equals(0.0));
      expect(state.avgHumidity, equals(0.0));
      expect(state.aboveNormalHumidity, equals(0.0));
      expect(state.avgPressure, equals(0.0));
      expect(state.aboveNormalPressure, equals(0.0));
      expect(state.minTemp, equals(0.0));
      expect(state.minHumidity, equals(0.0));
      expect(state.minPressure, equals(0.0));
      expect(state.bubbleToggle, equals(BubbleToggle.humidity));
      expect(state.errorMessage, isNull);
    });

    test('calculateAverageTem should only consider valid temperatures', () {
      final controller = container.read(sensorControllerProvider.notifier);
      final result = controller.calculateAverageTem(mocSensorData);
      // Only considers online sensors with valid temperatures
      expect(result, closeTo(27.0, 0.5));
    });

    test('calculateAverageTem should handle empty list', () {
      final controller = container.read(sensorControllerProvider.notifier);
      final result = controller.calculateAverageTem([]);
      expect(result, equals(0.0));
    });

    test('calculateAverageTem should handle NaN values', () {
      final controller = container.read(sensorControllerProvider.notifier);
      final sensorsWithNaN = [
        Sensor(
          id: 'sensor-1',
          location: 'Location 1',
          temperature: double.nan,
          humidity: 60.0,
          pressure: 1013.25,
          timestamp: DateTime.now(),
          isOnline: true,
        ),
        Sensor(
          id: 'sensor-2',
          location: 'Location 2',
          temperature: 30.0,
          humidity: 75.0,
          pressure: 1050.0,
          timestamp: DateTime.now(),
          isOnline: true,
        ),
      ];
      final result = controller.calculateAverageTem(sensorsWithNaN);
      expect(result, equals(30.0)); // Only considers the valid temperature
    });

    test('calculateCriticalAlert should only consider online sensors', () {
      final controller = container.read(sensorControllerProvider.notifier);
      final result = controller.calculateCriticalAlert(mocSensorData);
      // Only online sensors are considered for critical alerts
      expect(
        result,
        equals(0),
      ); // Assuming AppUtils.anomaly returns values < 50
    });

    test('calculateCriticalAlert should handle empty list', () {
      final controller = container.read(sensorControllerProvider.notifier);
      final result = controller.calculateCriticalAlert([]);
      expect(result, equals(0));
    });

    test('toggleBubbleSize should toggle between humidity and pressure', () {
      final controller = container.read(sensorControllerProvider.notifier);
      final initialState = controller.state.bubbleToggle;

      controller.toggleBubbleSize();
      expect(controller.state.bubbleToggle, equals(BubbleToggle.pressure));

      controller.toggleBubbleSize();
      expect(controller.state.bubbleToggle, equals(initialState));
    });

    test('refreshData should update all state fields correctly', () async {
      final controller = container.read(sensorControllerProvider.notifier);
      when(
        mockRepository.fetchSensorData(),
      ).thenAnswer((_) async => Right(mocSensorData));

      await controller.refreshData();

      final state = controller.state;
      // expect(state.status, equals(Status.loaded));
      expect(state.sensors, equals(mocSensorData));
      expect(state.totalSensors, equals(2));
      expect(state.activeSensors, equals(1));
      expect(state.inActiveSensors, equals(1));
      expect(state.avgTemp, closeTo(27.0, 0.5));
      expect(state.criticalAlerts, equals(0));
    });

    test('refreshData should handle error state correctly', () async {
      final controller = container.read(sensorControllerProvider.notifier);
      const errorMessage = 'Failed to fetch data';
      when(mockRepository.fetchSensorData()).thenAnswer(
        (_) async => Left(ValueFailure.empty(failedValue: errorMessage)),
      );

      await controller.refreshData();

      final state = controller.state;
      expect(state.status, equals(Status.error));
      expect(state.errorMessage, contains(errorMessage));
      expect(state.sensors, isEmpty);
      expect(state.totalSensors, equals(0));
      expect(state.activeSensors, equals(0));
      expect(state.inActiveSensors, equals(0));
      expect(state.criticalAlerts, equals(0));
      expect(state.avgTemp, equals(0.0));
    });

    test(
      'should maintain state consistency after multiple operations',
      () async {
        final controller = container.read(sensorControllerProvider.notifier);

        // Initial state
        expect(controller.state.status, equals(Status.initial));

        // First refresh
        when(
          mockRepository.fetchSensorData(),
        ).thenAnswer((_) async => Right(mocSensorData));
        await controller.refreshData();

        final stateAfterRefresh = controller.state;
        expect(stateAfterRefresh.status, equals(Status.loaded));
        expect(stateAfterRefresh.sensors.length, equals(2));

        // Toggle bubble size
        controller.toggleBubbleSize();
        expect(controller.state.bubbleToggle, equals(BubbleToggle.pressure));

        // Second refresh with error
        when(mockRepository.fetchSensorData()).thenAnswer(
          (_) async => Left(ValueFailure.empty(failedValue: 'Error')),
        );
        await controller.refreshData();

        final stateAfterError = controller.state;
        expect(stateAfterError.status, equals(Status.error));
        expect(stateAfterError.sensors, isEmpty);
        expect(
          stateAfterError.bubbleToggle,
          equals(BubbleToggle.pressure),
        ); // Should maintain toggle state
      },
    );
  });
}
