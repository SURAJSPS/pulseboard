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
import 'package:pulseboard/presentation/pages/dashboard/widgets/custom_bubble_chart.dart';
import 'package:pulseboard/presentation/pages/dashboard/widgets/summary_card.dart';

import '../../../data/datasources/mock/sensor_data_mock_test.dart';

import 'dashboard_page_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ISensorRepository>()])
void main() {
  late ISensorRepository mockRepository;
  late ProviderContainer container;

  setUp(() {
    mockRepository = MockISensorRepository();
    // Stub the repository to return an empty list by default
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
    return UncontrolledProviderScope(
      container: container,
      child: const MaterialApp(home: DashboardPage()),
    );
  }

  group('Dashboard Page', () {
    testWidgets('should display loading indicator when data is being fetched', (
      tester,
    ) async {
      final completer = Completer<Either<ValueFailure, List<Sensor>>>();
      when(
        mockRepository.fetchSensorData(),
      ).thenAnswer((_) => completer.future);

      await tester.pumpWidget(makeTestable());

      expect(find.text('Loading data...'), findsOneWidget);
      expect(find.byKey(const Key("Loading data...")), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should show empty state message when sensor list is empty', (
      tester,
    ) async {
      when(mockRepository.fetchSensorData()).thenAnswer((_) async => right([]));

      await tester.pumpWidget(makeTestable());
      await tester.pumpAndSettle();

      expect(find.text('No data available'), findsOneWidget);
      expect(find.byType(SummaryCard), findsNothing);
      expect(find.byType(BubbleChart), findsNothing);
    });

    testWidgets(
      'should render dashboard with correct data when mock sensors are provided',
      (tester) async {
        when(
          mockRepository.fetchSensorData(),
        ).thenAnswer((_) async => right(mocSensorData));

        await tester.pumpWidget(makeTestable());
        await tester.pumpAndSettle();

        // Verify app bar
        expect(find.text('Pulseboard Dashboard'), findsOneWidget);

        // Verify summary cards
        expect(find.byType(SummaryCard), findsNWidgets(3));
        expect(find.text('Active Sensors'), findsOneWidget);
        expect(find.text('Critical Alert'), findsOneWidget);
        expect(find.text('Avg. Temperature'), findsOneWidget);
        expect(find.text('1 / 2'), findsOneWidget);
        expect(find.text('1 Offline'), findsOneWidget);

        // Verify bubble chart components
        expect(find.byType(BubbleSizeToggle), findsOneWidget);
        expect(find.byType(BubbleChart), findsOneWidget);
        expect(find.byType(Bubble), findsNWidgets(2));
        expect(find.byType(CustomChart), findsOneWidget);

        // Verify bubble toggle buttons
        expect(find.text('Humidity'), findsOneWidget);
        expect(find.text('Pressure'), findsOneWidget);
        expect(find.byIcon(Icons.thermostat), findsOneWidget);
        expect(find.byIcon(Icons.sensors), findsOneWidget);
        expect(find.byIcon(Icons.warning_amber_rounded), findsOneWidget);
      },
    );

    testWidgets('should display error UI when repository fails to fetch data', (
      tester,
    ) async {
      when(mockRepository.fetchSensorData()).thenAnswer(
        (_) async => Left(ValueFailure.unexpected(failedValue: 'Test failure')),
      );

      await tester.pumpWidget(makeTestable());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.error), findsOneWidget);
      expect(find.byKey(const Key('Error message')), findsOneWidget);
    });

    testWidgets(
      'should display correct summary card values based on sensor data',
      (tester) async {
        when(
          mockRepository.fetchSensorData(),
        ).thenAnswer((_) async => right(mocSensorData));

        await tester.pumpWidget(makeTestable());
        await tester.pumpAndSettle();

        // Verify summary card values
        final summaryCards = find.byType(SummaryCard);
        expect(summaryCards, findsNWidgets(3));

        // Verify first card (Active Sensors)
        final firstCard = tester.widget<SummaryCard>(summaryCards.at(0));
        expect(firstCard.title, 'Active Sensors');
        expect(firstCard.value, '1 / 2');
        expect(firstCard.subtitle, '1 Offline');

        // Verify second card (Critical Alert)
        final secondCard = tester.widget<SummaryCard>(summaryCards.at(1));
        expect(secondCard.title, 'Critical Alert');
        expect(secondCard.value, '0');
        expect(secondCard.subtitle, 'Attention Needed');

        // Verify third card (Avg. Temperature)
        final thirdCard = tester.widget<SummaryCard>(summaryCards.at(2));
        expect(thirdCard.title, 'Avg. Temperature');
        expect(thirdCard.value, '27.50 °C');
        expect(thirdCard.subtitle, 'Normal');
      },
    );

    testWidgets(
      'should toggle bubble size metric when toggle button is pressed',
      (tester) async {
        when(
          mockRepository.fetchSensorData(),
        ).thenAnswer((_) async => right(mocSensorData));

        await tester.pumpWidget(makeTestable());
        await tester.pumpAndSettle();

        // Initially should show humidity toggle selected
        expect(find.text('Humidity'), findsOneWidget);

        // Tap on pressure toggle
        await tester.tap(find.text('Pressure'));
        await tester.pumpAndSettle();

        // Verify pressure toggle is now selected
        expect(find.text('Pressure'), findsOneWidget);
      },
    );

    testWidgets('should display correct bubble colors based on sensor status', (
      tester,
    ) async {
      when(
        mockRepository.fetchSensorData(),
      ).thenAnswer((_) async => right(mocSensorData));

      await tester.pumpWidget(makeTestable());
      await tester.pumpAndSettle();

      final bubbles = find.byType(Bubble);
      expect(bubbles, findsNWidgets(2));

      // Verify bubble colors
      final bubbleWidgets = tester.widgetList<Bubble>(bubbles);
      expect(bubbleWidgets.length, 2);
    });
  });
}
