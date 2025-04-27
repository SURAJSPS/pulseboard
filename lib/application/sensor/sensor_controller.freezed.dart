// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SensorState {

 List<Sensor> get sensors; int get activeSensors; int get totalSensors; int get inActiveSensors; int get criticalAlerts; double get avgTemp; double get aboveNormalTemp; double get avgHumidity; double get aboveNormalHumidity; double get avgPressure; double get aboveNormalPressure; double get minTemp; double get minHumidity; double get minPressure; Status get status; BubbleToggle get bubbleToggle; String? get errorMessage;
/// Create a copy of SensorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SensorStateCopyWith<SensorState> get copyWith => _$SensorStateCopyWithImpl<SensorState>(this as SensorState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SensorState&&const DeepCollectionEquality().equals(other.sensors, sensors)&&(identical(other.activeSensors, activeSensors) || other.activeSensors == activeSensors)&&(identical(other.totalSensors, totalSensors) || other.totalSensors == totalSensors)&&(identical(other.inActiveSensors, inActiveSensors) || other.inActiveSensors == inActiveSensors)&&(identical(other.criticalAlerts, criticalAlerts) || other.criticalAlerts == criticalAlerts)&&(identical(other.avgTemp, avgTemp) || other.avgTemp == avgTemp)&&(identical(other.aboveNormalTemp, aboveNormalTemp) || other.aboveNormalTemp == aboveNormalTemp)&&(identical(other.avgHumidity, avgHumidity) || other.avgHumidity == avgHumidity)&&(identical(other.aboveNormalHumidity, aboveNormalHumidity) || other.aboveNormalHumidity == aboveNormalHumidity)&&(identical(other.avgPressure, avgPressure) || other.avgPressure == avgPressure)&&(identical(other.aboveNormalPressure, aboveNormalPressure) || other.aboveNormalPressure == aboveNormalPressure)&&(identical(other.minTemp, minTemp) || other.minTemp == minTemp)&&(identical(other.minHumidity, minHumidity) || other.minHumidity == minHumidity)&&(identical(other.minPressure, minPressure) || other.minPressure == minPressure)&&(identical(other.status, status) || other.status == status)&&(identical(other.bubbleToggle, bubbleToggle) || other.bubbleToggle == bubbleToggle)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sensors),activeSensors,totalSensors,inActiveSensors,criticalAlerts,avgTemp,aboveNormalTemp,avgHumidity,aboveNormalHumidity,avgPressure,aboveNormalPressure,minTemp,minHumidity,minPressure,status,bubbleToggle,errorMessage);

@override
String toString() {
  return 'SensorState(sensors: $sensors, activeSensors: $activeSensors, totalSensors: $totalSensors, inActiveSensors: $inActiveSensors, criticalAlerts: $criticalAlerts, avgTemp: $avgTemp, aboveNormalTemp: $aboveNormalTemp, avgHumidity: $avgHumidity, aboveNormalHumidity: $aboveNormalHumidity, avgPressure: $avgPressure, aboveNormalPressure: $aboveNormalPressure, minTemp: $minTemp, minHumidity: $minHumidity, minPressure: $minPressure, status: $status, bubbleToggle: $bubbleToggle, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SensorStateCopyWith<$Res>  {
  factory $SensorStateCopyWith(SensorState value, $Res Function(SensorState) _then) = _$SensorStateCopyWithImpl;
@useResult
$Res call({
 List<Sensor> sensors, int activeSensors, int totalSensors, int inActiveSensors, int criticalAlerts, double avgTemp, double aboveNormalTemp, double avgHumidity, double aboveNormalHumidity, double avgPressure, double aboveNormalPressure, double minTemp, double minHumidity, double minPressure, Status status, BubbleToggle bubbleToggle, String? errorMessage
});




}
/// @nodoc
class _$SensorStateCopyWithImpl<$Res>
    implements $SensorStateCopyWith<$Res> {
  _$SensorStateCopyWithImpl(this._self, this._then);

  final SensorState _self;
  final $Res Function(SensorState) _then;

/// Create a copy of SensorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sensors = null,Object? activeSensors = null,Object? totalSensors = null,Object? inActiveSensors = null,Object? criticalAlerts = null,Object? avgTemp = null,Object? aboveNormalTemp = null,Object? avgHumidity = null,Object? aboveNormalHumidity = null,Object? avgPressure = null,Object? aboveNormalPressure = null,Object? minTemp = null,Object? minHumidity = null,Object? minPressure = null,Object? status = null,Object? bubbleToggle = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
sensors: null == sensors ? _self.sensors : sensors // ignore: cast_nullable_to_non_nullable
as List<Sensor>,activeSensors: null == activeSensors ? _self.activeSensors : activeSensors // ignore: cast_nullable_to_non_nullable
as int,totalSensors: null == totalSensors ? _self.totalSensors : totalSensors // ignore: cast_nullable_to_non_nullable
as int,inActiveSensors: null == inActiveSensors ? _self.inActiveSensors : inActiveSensors // ignore: cast_nullable_to_non_nullable
as int,criticalAlerts: null == criticalAlerts ? _self.criticalAlerts : criticalAlerts // ignore: cast_nullable_to_non_nullable
as int,avgTemp: null == avgTemp ? _self.avgTemp : avgTemp // ignore: cast_nullable_to_non_nullable
as double,aboveNormalTemp: null == aboveNormalTemp ? _self.aboveNormalTemp : aboveNormalTemp // ignore: cast_nullable_to_non_nullable
as double,avgHumidity: null == avgHumidity ? _self.avgHumidity : avgHumidity // ignore: cast_nullable_to_non_nullable
as double,aboveNormalHumidity: null == aboveNormalHumidity ? _self.aboveNormalHumidity : aboveNormalHumidity // ignore: cast_nullable_to_non_nullable
as double,avgPressure: null == avgPressure ? _self.avgPressure : avgPressure // ignore: cast_nullable_to_non_nullable
as double,aboveNormalPressure: null == aboveNormalPressure ? _self.aboveNormalPressure : aboveNormalPressure // ignore: cast_nullable_to_non_nullable
as double,minTemp: null == minTemp ? _self.minTemp : minTemp // ignore: cast_nullable_to_non_nullable
as double,minHumidity: null == minHumidity ? _self.minHumidity : minHumidity // ignore: cast_nullable_to_non_nullable
as double,minPressure: null == minPressure ? _self.minPressure : minPressure // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,bubbleToggle: null == bubbleToggle ? _self.bubbleToggle : bubbleToggle // ignore: cast_nullable_to_non_nullable
as BubbleToggle,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _SensorState extends SensorState {
  const _SensorState({required final  List<Sensor> sensors, required this.activeSensors, required this.totalSensors, required this.inActiveSensors, required this.criticalAlerts, required this.avgTemp, required this.aboveNormalTemp, required this.avgHumidity, required this.aboveNormalHumidity, required this.avgPressure, required this.aboveNormalPressure, required this.minTemp, required this.minHumidity, required this.minPressure, required this.status, required this.bubbleToggle, this.errorMessage}): _sensors = sensors,super._();
  

 final  List<Sensor> _sensors;
@override List<Sensor> get sensors {
  if (_sensors is EqualUnmodifiableListView) return _sensors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sensors);
}

@override final  int activeSensors;
@override final  int totalSensors;
@override final  int inActiveSensors;
@override final  int criticalAlerts;
@override final  double avgTemp;
@override final  double aboveNormalTemp;
@override final  double avgHumidity;
@override final  double aboveNormalHumidity;
@override final  double avgPressure;
@override final  double aboveNormalPressure;
@override final  double minTemp;
@override final  double minHumidity;
@override final  double minPressure;
@override final  Status status;
@override final  BubbleToggle bubbleToggle;
@override final  String? errorMessage;

/// Create a copy of SensorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SensorStateCopyWith<_SensorState> get copyWith => __$SensorStateCopyWithImpl<_SensorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SensorState&&const DeepCollectionEquality().equals(other._sensors, _sensors)&&(identical(other.activeSensors, activeSensors) || other.activeSensors == activeSensors)&&(identical(other.totalSensors, totalSensors) || other.totalSensors == totalSensors)&&(identical(other.inActiveSensors, inActiveSensors) || other.inActiveSensors == inActiveSensors)&&(identical(other.criticalAlerts, criticalAlerts) || other.criticalAlerts == criticalAlerts)&&(identical(other.avgTemp, avgTemp) || other.avgTemp == avgTemp)&&(identical(other.aboveNormalTemp, aboveNormalTemp) || other.aboveNormalTemp == aboveNormalTemp)&&(identical(other.avgHumidity, avgHumidity) || other.avgHumidity == avgHumidity)&&(identical(other.aboveNormalHumidity, aboveNormalHumidity) || other.aboveNormalHumidity == aboveNormalHumidity)&&(identical(other.avgPressure, avgPressure) || other.avgPressure == avgPressure)&&(identical(other.aboveNormalPressure, aboveNormalPressure) || other.aboveNormalPressure == aboveNormalPressure)&&(identical(other.minTemp, minTemp) || other.minTemp == minTemp)&&(identical(other.minHumidity, minHumidity) || other.minHumidity == minHumidity)&&(identical(other.minPressure, minPressure) || other.minPressure == minPressure)&&(identical(other.status, status) || other.status == status)&&(identical(other.bubbleToggle, bubbleToggle) || other.bubbleToggle == bubbleToggle)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sensors),activeSensors,totalSensors,inActiveSensors,criticalAlerts,avgTemp,aboveNormalTemp,avgHumidity,aboveNormalHumidity,avgPressure,aboveNormalPressure,minTemp,minHumidity,minPressure,status,bubbleToggle,errorMessage);

@override
String toString() {
  return 'SensorState(sensors: $sensors, activeSensors: $activeSensors, totalSensors: $totalSensors, inActiveSensors: $inActiveSensors, criticalAlerts: $criticalAlerts, avgTemp: $avgTemp, aboveNormalTemp: $aboveNormalTemp, avgHumidity: $avgHumidity, aboveNormalHumidity: $aboveNormalHumidity, avgPressure: $avgPressure, aboveNormalPressure: $aboveNormalPressure, minTemp: $minTemp, minHumidity: $minHumidity, minPressure: $minPressure, status: $status, bubbleToggle: $bubbleToggle, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SensorStateCopyWith<$Res> implements $SensorStateCopyWith<$Res> {
  factory _$SensorStateCopyWith(_SensorState value, $Res Function(_SensorState) _then) = __$SensorStateCopyWithImpl;
@override @useResult
$Res call({
 List<Sensor> sensors, int activeSensors, int totalSensors, int inActiveSensors, int criticalAlerts, double avgTemp, double aboveNormalTemp, double avgHumidity, double aboveNormalHumidity, double avgPressure, double aboveNormalPressure, double minTemp, double minHumidity, double minPressure, Status status, BubbleToggle bubbleToggle, String? errorMessage
});




}
/// @nodoc
class __$SensorStateCopyWithImpl<$Res>
    implements _$SensorStateCopyWith<$Res> {
  __$SensorStateCopyWithImpl(this._self, this._then);

  final _SensorState _self;
  final $Res Function(_SensorState) _then;

/// Create a copy of SensorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sensors = null,Object? activeSensors = null,Object? totalSensors = null,Object? inActiveSensors = null,Object? criticalAlerts = null,Object? avgTemp = null,Object? aboveNormalTemp = null,Object? avgHumidity = null,Object? aboveNormalHumidity = null,Object? avgPressure = null,Object? aboveNormalPressure = null,Object? minTemp = null,Object? minHumidity = null,Object? minPressure = null,Object? status = null,Object? bubbleToggle = null,Object? errorMessage = freezed,}) {
  return _then(_SensorState(
sensors: null == sensors ? _self._sensors : sensors // ignore: cast_nullable_to_non_nullable
as List<Sensor>,activeSensors: null == activeSensors ? _self.activeSensors : activeSensors // ignore: cast_nullable_to_non_nullable
as int,totalSensors: null == totalSensors ? _self.totalSensors : totalSensors // ignore: cast_nullable_to_non_nullable
as int,inActiveSensors: null == inActiveSensors ? _self.inActiveSensors : inActiveSensors // ignore: cast_nullable_to_non_nullable
as int,criticalAlerts: null == criticalAlerts ? _self.criticalAlerts : criticalAlerts // ignore: cast_nullable_to_non_nullable
as int,avgTemp: null == avgTemp ? _self.avgTemp : avgTemp // ignore: cast_nullable_to_non_nullable
as double,aboveNormalTemp: null == aboveNormalTemp ? _self.aboveNormalTemp : aboveNormalTemp // ignore: cast_nullable_to_non_nullable
as double,avgHumidity: null == avgHumidity ? _self.avgHumidity : avgHumidity // ignore: cast_nullable_to_non_nullable
as double,aboveNormalHumidity: null == aboveNormalHumidity ? _self.aboveNormalHumidity : aboveNormalHumidity // ignore: cast_nullable_to_non_nullable
as double,avgPressure: null == avgPressure ? _self.avgPressure : avgPressure // ignore: cast_nullable_to_non_nullable
as double,aboveNormalPressure: null == aboveNormalPressure ? _self.aboveNormalPressure : aboveNormalPressure // ignore: cast_nullable_to_non_nullable
as double,minTemp: null == minTemp ? _self.minTemp : minTemp // ignore: cast_nullable_to_non_nullable
as double,minHumidity: null == minHumidity ? _self.minHumidity : minHumidity // ignore: cast_nullable_to_non_nullable
as double,minPressure: null == minPressure ? _self.minPressure : minPressure // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,bubbleToggle: null == bubbleToggle ? _self.bubbleToggle : bubbleToggle // ignore: cast_nullable_to_non_nullable
as BubbleToggle,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
