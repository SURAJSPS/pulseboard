// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SensorModel _$SensorModelFromJson(Map<String, dynamic> json) => _SensorModel(
  id: json['id'] as String,
  location: json['location'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  temperature: (json['temperature'] as num).toDouble(),
  humidity: (json['humidity'] as num).toDouble(),
  pressure: (json['pressure'] as num).toDouble(),
  isOnline: json['isOnline'] as bool,
);

Map<String, dynamic> _$SensorModelToJson(_SensorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
      'timestamp': instance.timestamp.toIso8601String(),
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'pressure': instance.pressure,
      'isOnline': instance.isOnline,
    };
