// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SensorModel {

 String get id; String get location; DateTime get timestamp; double get temperature; double get humidity; double get pressure; bool get isOnline;
/// Create a copy of SensorModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SensorModelCopyWith<SensorModel> get copyWith => _$SensorModelCopyWithImpl<SensorModel>(this as SensorModel, _$identity);

  /// Serializes this SensorModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SensorModel&&(identical(other.id, id) || other.id == id)&&(identical(other.location, location) || other.location == location)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.pressure, pressure) || other.pressure == pressure)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,location,timestamp,temperature,humidity,pressure,isOnline);

@override
String toString() {
  return 'SensorModel(id: $id, location: $location, timestamp: $timestamp, temperature: $temperature, humidity: $humidity, pressure: $pressure, isOnline: $isOnline)';
}


}

/// @nodoc
abstract mixin class $SensorModelCopyWith<$Res>  {
  factory $SensorModelCopyWith(SensorModel value, $Res Function(SensorModel) _then) = _$SensorModelCopyWithImpl;
@useResult
$Res call({
 String id, String location, DateTime timestamp, double temperature, double humidity, double pressure, bool isOnline
});




}
/// @nodoc
class _$SensorModelCopyWithImpl<$Res>
    implements $SensorModelCopyWith<$Res> {
  _$SensorModelCopyWithImpl(this._self, this._then);

  final SensorModel _self;
  final $Res Function(SensorModel) _then;

/// Create a copy of SensorModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? location = null,Object? timestamp = null,Object? temperature = null,Object? humidity = null,Object? pressure = null,Object? isOnline = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as double,pressure: null == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as double,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SensorModel extends SensorModel {
  const _SensorModel({required this.id, required this.location, required this.timestamp, required this.temperature, required this.humidity, required this.pressure, required this.isOnline}): super._();
  factory _SensorModel.fromJson(Map<String, dynamic> json) => _$SensorModelFromJson(json);

@override final  String id;
@override final  String location;
@override final  DateTime timestamp;
@override final  double temperature;
@override final  double humidity;
@override final  double pressure;
@override final  bool isOnline;

/// Create a copy of SensorModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SensorModelCopyWith<_SensorModel> get copyWith => __$SensorModelCopyWithImpl<_SensorModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SensorModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SensorModel&&(identical(other.id, id) || other.id == id)&&(identical(other.location, location) || other.location == location)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.pressure, pressure) || other.pressure == pressure)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,location,timestamp,temperature,humidity,pressure,isOnline);

@override
String toString() {
  return 'SensorModel(id: $id, location: $location, timestamp: $timestamp, temperature: $temperature, humidity: $humidity, pressure: $pressure, isOnline: $isOnline)';
}


}

/// @nodoc
abstract mixin class _$SensorModelCopyWith<$Res> implements $SensorModelCopyWith<$Res> {
  factory _$SensorModelCopyWith(_SensorModel value, $Res Function(_SensorModel) _then) = __$SensorModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String location, DateTime timestamp, double temperature, double humidity, double pressure, bool isOnline
});




}
/// @nodoc
class __$SensorModelCopyWithImpl<$Res>
    implements _$SensorModelCopyWith<$Res> {
  __$SensorModelCopyWithImpl(this._self, this._then);

  final _SensorModel _self;
  final $Res Function(_SensorModel) _then;

/// Create a copy of SensorModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? location = null,Object? timestamp = null,Object? temperature = null,Object? humidity = null,Object? pressure = null,Object? isOnline = null,}) {
  return _then(_SensorModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as double,pressure: null == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as double,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
