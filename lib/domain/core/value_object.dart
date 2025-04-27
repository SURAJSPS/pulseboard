import 'package:dartz/dartz.dart';
import 'value_failure.dart';

abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    return value.fold(
      (failure) => throw UnexpectedValueError(failure),
      (value) => value,
    );
  }

  bool isValid() => value.isRight();

  @override
  String toString() => 'ValueObject(value: $value)';
}

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}