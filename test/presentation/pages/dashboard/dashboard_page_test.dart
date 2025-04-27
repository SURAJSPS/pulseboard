// test/presentation/pages/dashboard/dashboard_page_test.dart

import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:pulseboard/domain/di/app_providers.dart';
import 'package:pulseboard/domain/core/value_failure.dart';
import 'package:pulseboard/domain/entities/sensor.dart';
import 'package:pulseboard/domain/repositories/i_sensor_repository.dart';
import 'package:pulseboard/presentation/pages/dashboard/dashboard_page.dart';
import 'package:pulseboard/presentation/pages/dashboard/widgets/bubble.dart';
import 'package:pulseboard/presentation/pages/dashboard/widgets/bubble_size_toggle.dart';
import 'package:pulseboard/presentation/pages/dashboard/widgets/bulle_chart.dart';
import 'package:pulseboard/presentation/pages/dashboard/widgets/custom_bubble_chart.dart' show CustomChart;
import 'package:pulseboard/presentation/pages/dashboard/widgets/summary_card.dart';

import '../../../data/datasources/mock/sensor_data_mock_test.dart';

import 'dashboard_page_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ISensorRepository>()])
void main() {
  late ISensorRepository mockRepository;
  late ProviderContainer container;

  setUp(() {
    mockRepository = MockISensorRepository();
    // Stub the repository to return an empty list
    when(
      mockRepository.fetchSensorData(),
    ).thenAnswer((_) async => Right(<Sensor>[]));
    // Create a ProviderContainer with our override
    container = ProviderContainer(
      overrides: [sensorRepositoryProvider.overrideWithValue(mockRepository)],
    );
  });

  tearDown(() {
    container.dispose();
  });

  Widget makeTestable() {
    // Use UncontrolledProviderScope to inject the custom container
    return UncontrolledProviderScope(
      container: container,
      child: const MaterialApp(home: DashboardPage()),
    );
  }

  group('Dashboard Page', () {
    testWidgets('should display loading indicator when data is being fetched', (tester) async {
      final completer = Completer<Either<ValueFailure, List<Sensor>>>();
      when(
        mockRepository.fetchSensorData(),
      ).thenAnswer((_) => completer.future);

      await tester.pumpWidget(makeTestable());

      expect(find.text('Loading data...'), findsOneWidget);
       expect(find.byKey(Key("Loading data...")), findsOneWidget);

   
    });

    testWidgets('should show empty state message when sensor list is empty', (tester) async {
      when(mockRepository.fetchSensorData()).thenAnswer((_) async => right([]));

      await tester.pumpWidget(makeTestable());
      // let the microtask complete and UI settle
      await tester.pump();
      await tester.pumpAndSettle();

      // Since repository returns empty list, summary cards should show zeros
      expect(find.text('No data available'), findsOneWidget);
     
    });

    testWidgets('should render dashboard with correct data when mock sensors are provided', (tester) async {
      when(
        mockRepository.fetchSensorData(),
      ).thenAnswer((_) async => right(mocSensorData));

      await tester.pumpWidget(makeTestable());

      await tester.pump();
      await tester.pumpAndSettle();

      expect(find.text('Active Sensors'), findsOneWidget);
      expect(find.text('Critical Alert'), findsOneWidget);
      expect(find.text('Avg. Temperature'), findsOneWidget);
      expect(find.text('Active Sensors'), findsOneWidget);
      expect(find.text('1 / 2'), findsOneWidget);
      expect(find.text('1 Offline'), findsOneWidget);
     
      expect(find.byType(BubbleSizeToggle), findsOneWidget);
      expect(find.byType(BubbleChart), findsOneWidget);
      expect(find.byType(Bubble), findsNWidgets(2));
      expect(find.byType(SummaryCard), findsNWidgets(3));
    expect(find.byType(BubbleSizeToggle), findsOneWidget);

    expect(find.byType(CustomChart), findsOneWidget);
    });

    testWidgets('should display error UI when repository fails to fetch data', (tester) async {
      // Make repository throw an error
      when(mockRepository.fetchSensorData()).thenAnswer(
        (_) async => Left(ValueFailure.unexpected(failedValue: 'Test failure')),
      );

      await tester.pumpWidget(makeTestable());
      await tester.pump();
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.error), findsOneWidget);
      expect(find.byKey(Key('Error message')), findsOneWidget);
    });
  });








}




