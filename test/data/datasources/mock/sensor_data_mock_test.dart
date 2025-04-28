import 'package:flutter_test/flutter_test.dart';
import 'package:pulseboard/domain/entities/sensor.dart';

final List<Sensor> mocSensorData = <Sensor>[
  Sensor(
    id: '1',
    location: 'Sensor 1',
    temperature: 25.0,
    humidity: 50.0,
    pressure: 1013.0,
    timestamp: DateTime.now(),
    isOnline: true,
  ),
  Sensor(
    id: '2',
    location: 'Sensor 2',
    temperature: 30.0,
    humidity: 50.0,
    pressure: 1015.0,
    timestamp: DateTime.now(),
    isOnline: false,
  ),
];

void main() {
  test('mock sensor data has correct values', () {
    expect(mocSensorData.length, 2);
    expect(mocSensorData[0].id, '1');
    expect(mocSensorData[1].isOnline, false);
  });
}
