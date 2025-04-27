// lib/providers/app_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulseboard/core/routes/app_router.dart';
import 'package:pulseboard/domain/repositories/i_sensor_repository.dart';
import 'package:pulseboard/data/datasources/mock/sensor_data_mock.dart';
import 'package:pulseboard/data/repositories/sensor_repository.dart';

// // 1. API Client (Singleton)
// final apiClientProvider = Provider<ApiClient>((ref) {
//   return ApiClient(baseUrl: 'https://api.example.com');
// });

// 2. Database (Async initialization)
// final databaseProvider = FutureProvider<Database>((ref) async {
//   final db = Database();
//   await db.init();
//   return db;
// });

// 3. Repository (Depends on API & Database)
// final userRepositoryProvider = Provider<UserRepository>((ref) {
//   final api = ref.watch(apiClientProvider);
//   final db = ref.watch(databaseProvider).value; // Access async value
//   return UserRepository(api, db);
// });

// 1. Router (Singleton)
final routerProvider = Provider<AppRouter>((ref) => AppRouter());

// 2. Repository (Depends on API & Database)

final sensorDataServiceProvider = Provider<SensorDataService>(
  (ref) => SensorDataService(),
);

final sensorRepositoryProvider = Provider<ISensorRepository>((ref) {
  final sensorService = ref.watch(sensorDataServiceProvider);

  return SensorRepository(
    dataService: sensorService, // Pass the API client
  );
});
