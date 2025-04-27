
import 'package:pulseboard/domain/entities/sensor.dart';



final List<Sensor> mocSensorData=<Sensor>[
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