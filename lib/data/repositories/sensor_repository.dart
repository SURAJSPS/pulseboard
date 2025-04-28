import 'package:dartz/dartz.dart';
import 'package:pulseboard/domain/core/value_failure.dart';
import 'package:pulseboard/domain/entities/sensor.dart';
import 'package:pulseboard/domain/repositories/i_sensor_repository.dart';
import 'package:pulseboard/data/datasources/mock/sensor_data_mock.dart';

class SensorRepository implements ISensorRepository {
  SensorDataService dataService;
  SensorRepository({required this.dataService});
  @override
  Future<Either<ValueFailure, List<Sensor>>> fetchSensorData()async {
    final data = await dataService.generateMockData();

    if (data.isNotEmpty) {
      return right(data.map((e) => e.toDomain()).toList());
    } else {
      return left(ValueFailure.empty(failedValue: "failedValue"));
    }
  }
}
