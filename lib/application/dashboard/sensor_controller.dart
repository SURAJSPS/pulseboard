import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pulseboard/core/utils/app_utils.dart';
import 'package:pulseboard/domain/di/app_providers.dart';
import 'package:pulseboard/domain/repositories/i_sensor_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/sensor.dart';

part 'sensor_controller.g.dart';
part 'sensor_controller.freezed.dart';

// Define the states for sensor data
enum Status { initial, loading, loaded, error }

enum BubbleToggle { humidity, pressure }

@freezed
sealed class SensorState with _$SensorState {
  const factory SensorState({
    required List<Sensor> sensors,
    required int activeSensors,
    required int totalSensors,
    required int inActiveSensors,
    required int criticalAlerts,
    required double avgTemp,
    required double aboveNormalTemp,
    required double avgHumidity,
    required double aboveNormalHumidity,
    required double avgPressure,
    required double aboveNormalPressure,
    required double minTemp,
    required double minHumidity,
    required double minPressure,
    required Status status,
    required BubbleToggle bubbleToggle,
    String? errorMessage,
  }) = _SensorState;

  const SensorState._();

  factory SensorState.initial() => const SensorState(
    sensors: [],
    status: Status.initial,
    totalSensors: 0,
    inActiveSensors: 0,
    activeSensors: 0,
    criticalAlerts: 0,
    avgTemp: 0.0,
    aboveNormalTemp: 0.0,
    avgHumidity: 0.0,
    aboveNormalHumidity: 0.0,
    avgPressure: 0.0,
    aboveNormalPressure: 0.0,
    minTemp: 0.0,
    minHumidity: 0.0,
    minPressure: 0.0,
    errorMessage: null,
    bubbleToggle: BubbleToggle.humidity,
  );
}

@riverpod
class SensorController extends _$SensorController {
  late final ISensorRepository _sensorRepository;

  @override
  SensorState build() {
    _sensorRepository = ref.watch(sensorRepositoryProvider);

    Future.microtask(() => refreshData());

    return SensorState.initial();
  }

  Future<void> refreshData() async {
    state = state.copyWith(status: Status.loading);

    final failureOrSuccess = await _sensorRepository.fetchSensorData();

   

    state = failureOrSuccess.fold(
      (f) {
        return state.copyWith(
          sensors: [],
          status: Status.error,
          errorMessage: f.toString(),
        );
      },
      (sensor) {
        return state.copyWith(
          sensors: sensor,
          status: Status.loaded,
          avgTemp: calculateAverageTem(sensor),
          totalSensors: sensor.length,
          inActiveSensors: sensor.where((s) => !s.isOnline).length,
          activeSensors: sensor.where((s) => s.isOnline).length,
          criticalAlerts: calculateCriticalAlert(sensor),
        );
      },
    );
  }

  void toggleBubbleSize() {
    state = state.copyWith(
      bubbleToggle:
          state.bubbleToggle == BubbleToggle.humidity
              ? BubbleToggle.pressure
              : BubbleToggle.humidity,
    );
  }

  double calculateAverageTem(List<Sensor> sensors) {
    if (sensors.isEmpty) return 0.0;

    final validTemps = sensors.where((s) => !s.temperature.isNaN);
    return validTemps.isEmpty
        ? 0.0
        : validTemps.fold<double>(0.0, (sum, s) => sum + s.temperature) /
            validTemps.length;
  }

  int calculateCriticalAlert(List<Sensor> sensors) {
    if (sensors.isEmpty) return 0;
    int criticalAlerts = 0;

    for (final sensor in sensors) {
      if (sensor.isOnline) {
        final anomaly = AppUtils.anomaly(sensor);

        if (anomaly >= 50) {
          // Assuming 50% is the threshold for a critical alert
          criticalAlerts++;
        }
      }
      // Continue checking other sensors even if some are offline
    }
    return criticalAlerts;
  }
}
