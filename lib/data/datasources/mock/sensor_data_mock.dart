import 'dart:math';


import '../../../domain/entities/sensor.dart';

class SensorDataService {
  final List<String> locations = ['Line A', 'Line B', 'Line C', 'Line D'];
  final random = Random();

  double _randomInRange(double min, double max) {
    return min + random.nextDouble() * (max - min);
  }

  Future<List<Sensor>> generateMockData({int limit = 20}) async {
    final List<Sensor> readings = [];
    final today = DateTime.now();
    final random = Random();

    // 1. First create GUARANTEED readings for all colors
    final guaranteedReadings = [
      // Green (normal) - 2 samples to ensure visibility
      _createSensor(
        id: "green_1",
        temp: 25.0, // 22-40°C = normal
        humi: 50.0, // 45-60% = normal
        pres: 1010.0, // 993-1033 hPa = normal
        hour: 9,
        today: today,
        locations: locations,
      ),
      _createSensor(
        id: "green_2",
        temp: 40.0,
        humi: 55.0,
        pres: 1013.0,
        hour: 13,
        today: today,
        locations: locations,
      ),
      // Yellow (mild anomaly)
      _createSensor(
        id: "yellow_1",
        temp: 45.0, // Above 40°C = anomaly
        humi: 65.0, // Above 60% = anomaly
        pres: 1050.0, // Above 1033 hPa = anomaly
        hour: 10,
        today: today,
        locations: locations,
      ),
      // Red (severe anomaly)
      _createSensor(
        id: "red_1",
        temp: 5.0, // Far below 22°C
        humi: 20.0, // Far below 45%
        pres: 920.0, // Far below 993 hPa
        hour: 14,
        today: today,
        locations: locations,
      ),
      // Gray (offline)
      _createSensor(
        id: "gray_1",
        temp: 88,
        humi: 0,
        pres: 50,
        hour: 16,
        today: today,
        locations: locations,
        isOnline: false,
      ),
    ];

    // 2. Add remaining random readings (keeping ~30% as offline)
    final remaining = limit - guaranteedReadings.length;
    for (int i = 0; i < remaining; i++) {
      final isOnline = random.nextDouble() > 0.3;
      readings.add(
        Sensor(
          id: "$i",
          location: locations[random.nextInt(locations.length)],
          timestamp: DateTime(
            today.year,
            today.month,
            today.day,
            8 + random.nextInt(10),
          ),
          temperature: _randomInRange(0, 100),
          humidity: isOnline ? _randomInRange(0, 100) : double.nan,
          pressure: isOnline ? _randomInRange(900, 1100) : double.nan,
          isOnline: isOnline,
        ),
      );
    }

    // 3. Combine and shuffle
    readings.addAll(guaranteedReadings);
    readings.shuffle(random);
    return readings;
  }

  // Helper to create consistent sensor readings
  Sensor _createSensor({
    required String id,
    required double temp,
    required double humi,
    required double pres,
    required int hour,
    required DateTime today,
    required List<String> locations,
    bool isOnline = true,
  }) {
    return Sensor(
      id: id,
      location: locations[int.parse(id.split('_').last) % locations.length],
      timestamp: DateTime(today.year, today.month, today.day, hour),
      temperature: temp,
      humidity: isOnline ? humi : double.nan,
      pressure: isOnline ? pres : double.nan,
      isOnline: isOnline,
    );
  }
}
