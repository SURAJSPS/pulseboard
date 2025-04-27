import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pulseboard/data/models/sensor_model.dart';

part 'sensor.freezed.dart';
part 'sensor.g.dart';

@freezed
abstract class Sensor with _$Sensor {
  const Sensor._();
  const factory Sensor({
    required String id,
    required String location,
    required DateTime timestamp,
    required double temperature,
    required double humidity,
    required double pressure,

    @Default(true) bool isOnline,
  }) = _Sensor;
  factory Sensor.fromJson(Map<String, dynamic> json) => _$SensorFromJson(json);

  // Convert Sensor (Domain Entity) to SensorModel
  SensorModel fromDomain() => SensorModel(
    id: id,
    location: location,
    timestamp: timestamp,
    temperature: temperature,
    humidity: humidity,
    pressure: pressure,

    isOnline: isOnline,
  );
}
