import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failure.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.exceedingLength({
    required T failedValue,
    required int maxLength,
  }) = ExceedingLength<T>;

  const factory ValueFailure.empty({required T failedValue}) = Empty<T>;

  const factory ValueFailure.multiline({required T failedValue}) = Multiline<T>;

  const factory ValueFailure.listTooLong({
    required List<T> failedValue,
    required int maxLength,
  }) = ListTooLong<T>;

  const factory ValueFailure.unexpected({required T failedValue}) =
      Unexpected<T>;
}
