// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'value_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ValueFailure<T> {

 Object? get failedValue;



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValueFailure<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>(failedValue: $failedValue)';
}


}

/// @nodoc
class $ValueFailureCopyWith<T,$Res>  {
$ValueFailureCopyWith(ValueFailure<T> _, $Res Function(ValueFailure<T>) __);
}


/// @nodoc


class ExceedingLength<T> implements ValueFailure<T> {
  const ExceedingLength({required this.failedValue, required this.maxLength});
  

@override final  T failedValue;
 final  int maxLength;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExceedingLengthCopyWith<T, ExceedingLength<T>> get copyWith => _$ExceedingLengthCopyWithImpl<T, ExceedingLength<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExceedingLength<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue)&&(identical(other.maxLength, maxLength) || other.maxLength == maxLength));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue),maxLength);

@override
String toString() {
  return 'ValueFailure<$T>.exceedingLength(failedValue: $failedValue, maxLength: $maxLength)';
}


}

/// @nodoc
abstract mixin class $ExceedingLengthCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $ExceedingLengthCopyWith(ExceedingLength<T> value, $Res Function(ExceedingLength<T>) _then) = _$ExceedingLengthCopyWithImpl;
@useResult
$Res call({
 T failedValue, int maxLength
});




}
/// @nodoc
class _$ExceedingLengthCopyWithImpl<T,$Res>
    implements $ExceedingLengthCopyWith<T, $Res> {
  _$ExceedingLengthCopyWithImpl(this._self, this._then);

  final ExceedingLength<T> _self;
  final $Res Function(ExceedingLength<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,Object? maxLength = null,}) {
  return _then(ExceedingLength<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,maxLength: null == maxLength ? _self.maxLength : maxLength // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class Empty<T> implements ValueFailure<T> {
  const Empty({required this.failedValue});
  

@override final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmptyCopyWith<T, Empty<T>> get copyWith => _$EmptyCopyWithImpl<T, Empty<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Empty<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.empty(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $EmptyCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $EmptyCopyWith(Empty<T> value, $Res Function(Empty<T>) _then) = _$EmptyCopyWithImpl;
@useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$EmptyCopyWithImpl<T,$Res>
    implements $EmptyCopyWith<T, $Res> {
  _$EmptyCopyWithImpl(this._self, this._then);

  final Empty<T> _self;
  final $Res Function(Empty<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(Empty<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class Multiline<T> implements ValueFailure<T> {
  const Multiline({required this.failedValue});
  

@override final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MultilineCopyWith<T, Multiline<T>> get copyWith => _$MultilineCopyWithImpl<T, Multiline<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Multiline<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.multiline(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $MultilineCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $MultilineCopyWith(Multiline<T> value, $Res Function(Multiline<T>) _then) = _$MultilineCopyWithImpl;
@useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$MultilineCopyWithImpl<T,$Res>
    implements $MultilineCopyWith<T, $Res> {
  _$MultilineCopyWithImpl(this._self, this._then);

  final Multiline<T> _self;
  final $Res Function(Multiline<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(Multiline<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class ListTooLong<T> implements ValueFailure<T> {
  const ListTooLong({required final  List<T> failedValue, required this.maxLength}): _failedValue = failedValue;
  

 final  List<T> _failedValue;
@override List<T> get failedValue {
  if (_failedValue is EqualUnmodifiableListView) return _failedValue;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_failedValue);
}

 final  int maxLength;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListTooLongCopyWith<T, ListTooLong<T>> get copyWith => _$ListTooLongCopyWithImpl<T, ListTooLong<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListTooLong<T>&&const DeepCollectionEquality().equals(other._failedValue, _failedValue)&&(identical(other.maxLength, maxLength) || other.maxLength == maxLength));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_failedValue),maxLength);

@override
String toString() {
  return 'ValueFailure<$T>.listTooLong(failedValue: $failedValue, maxLength: $maxLength)';
}


}

/// @nodoc
abstract mixin class $ListTooLongCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $ListTooLongCopyWith(ListTooLong<T> value, $Res Function(ListTooLong<T>) _then) = _$ListTooLongCopyWithImpl;
@useResult
$Res call({
 List<T> failedValue, int maxLength
});




}
/// @nodoc
class _$ListTooLongCopyWithImpl<T,$Res>
    implements $ListTooLongCopyWith<T, $Res> {
  _$ListTooLongCopyWithImpl(this._self, this._then);

  final ListTooLong<T> _self;
  final $Res Function(ListTooLong<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failedValue = null,Object? maxLength = null,}) {
  return _then(ListTooLong<T>(
failedValue: null == failedValue ? _self._failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as List<T>,maxLength: null == maxLength ? _self.maxLength : maxLength // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class Unexpected<T> implements ValueFailure<T> {
  const Unexpected({required this.failedValue});
  

@override final  T failedValue;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnexpectedCopyWith<T, Unexpected<T>> get copyWith => _$UnexpectedCopyWithImpl<T, Unexpected<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unexpected<T>&&const DeepCollectionEquality().equals(other.failedValue, failedValue));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failedValue));

@override
String toString() {
  return 'ValueFailure<$T>.unexpected(failedValue: $failedValue)';
}


}

/// @nodoc
abstract mixin class $UnexpectedCopyWith<T,$Res> implements $ValueFailureCopyWith<T, $Res> {
  factory $UnexpectedCopyWith(Unexpected<T> value, $Res Function(Unexpected<T>) _then) = _$UnexpectedCopyWithImpl;
@useResult
$Res call({
 T failedValue
});




}
/// @nodoc
class _$UnexpectedCopyWithImpl<T,$Res>
    implements $UnexpectedCopyWith<T, $Res> {
  _$UnexpectedCopyWithImpl(this._self, this._then);

  final Unexpected<T> _self;
  final $Res Function(Unexpected<T>) _then;

/// Create a copy of ValueFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failedValue = freezed,}) {
  return _then(Unexpected<T>(
failedValue: freezed == failedValue ? _self.failedValue : failedValue // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

// dart format on
