// lib/core/utils/app_utils.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pulseboard/domain/entities/sensor.dart';

class AppUtils {
  // Calculate Temperature Anomaly Percentage
  static double temperatureAnomaly(double temperature) {
    if (temperature < 22.0) {
      return ((22.0 - temperature) / 22.0) * 100;
    } else if (temperature > 40.0) {
      return ((temperature - 40.0) / 60.0) * 100;
    }
    return 0.0;
  }

  // Calculate Humidity Anomaly Percentage
  static double humidityAnomaly(double humidity) {
    if (humidity < 45.0) {
      return ((45.0 - humidity) / 45.0) * 100;
    } else if (humidity > 60.0) {
      return ((humidity - 60.0) / 40.0) * 100;
    }
    return 0.0;
  }

  // Calculate Pressure Anomaly Percentage
  static double pressureAnomaly(double pressure) {
    if (pressure < 993.0) {
      return ((993.0 - pressure) / 93.0) * 100;
    } else if (pressure > 1033.0) {
      return ((pressure - 1033.0) / 67.0) * 100;
    }
    return 0.0;
  }

  // Calculate Combined Anomaly Percentage (Weighted Average)
  static double anomaly(
    Sensor sensor, {

    double tempWeight = 0.5,
    double humidityWeight = 0.3,
    double pressureWeight = 0.2,
  }) {
    return (temperatureAnomaly(sensor.temperature) * tempWeight) +
        (humidityAnomaly(sensor.humidity) * humidityWeight) +
        (pressureAnomaly(sensor.pressure) * pressureWeight);
  }

  // Get color based on anomaly percentage
  static Color determineAnomalyColor(double anomalyPercentage) {
    if (anomalyPercentage == -1) {
      return Colors.grey; // Offline or invalid
    } else if (anomalyPercentage == 0) {
      return Colors.green; // Normal
    } else if (anomalyPercentage <= 50) {
      return Colors.yellow; // Warning
    } else {
      return Colors.red; // Critical
    }
  }

  // Get color for temperature, humidity, and pressure anomalies
  static Color getSensorAnomalyColor(Sensor sensor) {
    if (!sensor.isOnline) {
      return Colors.grey; // Offline or invalid
    }
    return determineAnomalyColor(anomaly(sensor));
  }

  //
  // static tempAnomaly(double temperature) {
  //   // Temperature anomaly (0-100%)
  //   return calculateDeviation(
  //     temperature,
  //     typicalMin: 22,
  //     typicalMax: 40,
  //     absoluteMin: 0,
  //     absoluteMax: 100,
  //   );
  // }
  //
  // static humAnomaly(double humidity) {
  //   // Humidity anomaly (0-100%)
  //   return calculateDeviation(
  //     humidity,
  //     typicalMin: 45,
  //     typicalMax: 60,
  //     absoluteMin: 0,
  //     absoluteMax: 100,
  //   );
  // }
  // static preAnomaly(double pressure) {
  //   // Pressure anomaly (0-100%)
  //   return calculateDeviation(
  //     pressure,
  //     typicalMin: 950,
  //     typicalMax: 1050,
  //     absoluteMin: 900,
  //     absoluteMax: 1100,
  //   );
  // }
  //
  //
  //
  //
  // static double calculateAnomaly(Sensor sensor) {
  //   // Temperature anomaly (0-100%)
  //   final tempAnomaly = calculateDeviation(
  //     sensor.temperature,
  //     typicalMin: 22,
  //     typicalMax: 40,
  //     absoluteMin: 0,
  //     absoluteMax: 100,
  //   );
  //
  //   // Humidity anomaly (0-100%)
  //   final humidityAnomaly = calculateDeviation(
  //     sensor.humidity,
  //     typicalMin: 45,
  //     typicalMax: 60,
  //     absoluteMin: 0,
  //     absoluteMax: 100,
  //   );
  //
  //   // Pressure anomaly (0-100%)
  //   final pressureAnomaly = calculateDeviation(
  //     sensor.pressure,
  //     typicalMin: 950,
  //     typicalMax: 1050,
  //     absoluteMin: 900,
  //     absoluteMax: 1100,
  //   );
  //
  //   // Weighted average (adjust weights as needed)
  //   return (tempAnomaly * 0.5 + humidityAnomaly * 0.3 + pressureAnomaly * 0.2);
  // }
  //
  // static double calculateDeviation(
  //   double value, {
  //   required double typicalMin,
  //   required double typicalMax,
  //   required double absoluteMin,
  //   required double absoluteMax,
  // }) {
  //   if (value >= typicalMin && value <= typicalMax) return 0.0; // No anomaly
  //
  //   // Calculate % deviation outside typical range
  //   if (value < typicalMin) {
  //     return ((typicalMin - value) / (typicalMin - absoluteMin)) * 100;
  //   } else {
  //     return ((value - typicalMax) / (absoluteMax - typicalMax)) * 100;
  //   }
  // }

  // static Color bubbleColor(Sensor sensor) {
  //   // Calculate anomaly level
  //   final anomalyLevel =
  //       sensor.isOnline ? AppUtils.calculateAnomaly(sensor) : -1;
  //
  //   if (!sensor.isOnline || anomalyLevel == -1) {
  //     print(
  //       ' ${sensor.location}Sensor is offline or anomaly level is -1${sensor.isOnline}',
  //     );
  //     return Colors.grey;
  //   } else if (anomalyLevel <= 0) {
  //     return Color(0xFF4CAF50);
  //   } else if (anomalyLevel <= 50) {
  //     return Color(0xFFFFA726);
  //   } else {
  //     return Colors.red;
  //   }
  // }

  static String date(DateTime date) {
    return date.difference(DateTime.now()).inDays == 0
        ? 'Today'
        : date.difference(DateTime.now()).inDays == -1
        ? 'Yesterday'
        : DateFormat('yyyy-MM-dd').format(date);
  }

  static String time(DateTime date) {
    return DateFormat('HH:mm a').format(date);
  }
}
