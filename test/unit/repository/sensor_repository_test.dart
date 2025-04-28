import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pulseboard/data/datasources/mock/sensor_data_mock.dart';
import 'package:pulseboard/data/models/sensor_model.dart';
import 'package:pulseboard/data/repositories/sensor_repository.dart';
import 'package:pulseboard/domain/core/value_failure.dart';

import 'package:pulseboard/domain/entities/sensor.dart';

import 'sensor_repository_test.mocks.dart';

@GenerateMocks([SensorDataService])
void main() {
  late SensorRepository repository;
  late MockSensorDataService mockDataService;

  setUp(() {
    mockDataService = MockSensorDataService();
    repository = SensorRepository(dataService: mockDataService);
  });

  test('fetchSensorData returns Right with data', () async {
    final sensors = [
      SensorModel(
        id: '1',
        location: 'Line A',
        timestamp: DateTime.now(),
        temperature: 30.0,
        humidity: 50.0,
        pressure: 1000.0,
        isOnline: true,
      ),
      SensorModel(
        id: '1',
        location: 'Line A',
        timestamp: DateTime.now(),
        temperature: 30.0,
        humidity: 50.0,
        pressure: 1000.0,
        isOnline: false,
      ),
    ];
    when(mockDataService.generateMockData()).thenAnswer((_) async => sensors);

    final result = await repository.fetchSensorData();
    expect(result.isRight(), true);
    expect(
      result.getOrElse(() => []),
      sensors.map((e) => e.toDomain()).toList(),
    );
  });

  test('fetchSensorData returns Left for empty data', () async {
    when(mockDataService.generateMockData()).thenAnswer((_) async => []);

    final result = await repository.fetchSensorData();
    expect(result.isLeft(), true);
  });
}
