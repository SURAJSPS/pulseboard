import 'package:dartz/dartz.dart';
import 'package:pulseboard/domain/core/value_failure.dart';
import 'package:pulseboard/domain/entities/sensor.dart';

abstract class ISensorRepository {
  Future<Either<ValueFailure, List<Sensor>>> fetchSensorData();
}
