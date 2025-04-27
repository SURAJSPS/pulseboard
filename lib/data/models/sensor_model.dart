import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/sensor.dart';

part 'sensor_model.freezed.dart';
part 'sensor_model.g.dart';

@freezed
abstract class SensorModel with _$SensorModel {
  const SensorModel._();
  const factory SensorModel({
    required String id,
    required String location,
    required DateTime timestamp,
    required double temperature,
    required double humidity,
    required double pressure,
    
    required bool isOnline,
  }) = _SensorModel;

  factory SensorModel.fromJson(Map<String, dynamic> json) =>
      _$SensorModelFromJson(json);

  // Convert SensorModel to SensorReading (Domain Entity)
  Sensor toDomain() => Sensor(
    id: id,
    location: location,
    timestamp: timestamp,
    temperature: temperature,
    humidity: humidity,
    pressure: pressure,
   
    isOnline: isOnline,
  );
}
