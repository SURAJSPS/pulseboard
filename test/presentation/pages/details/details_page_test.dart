import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pulseboard/domain/entities/sensor.dart';
import 'package:pulseboard/presentation/pages/details/details_page.dart';
import 'package:pulseboard/presentation/pages/details/widgets/detail_card.dart';
import 'package:pulseboard/presentation/pages/dashboard/widgets/summary_card.dart';
import 'package:pulseboard/presentation/pages/dashboard/widgets/bulle_chart.dart';

void main() {
  group('DetailsScreen Tests', () {
    late Sensor testSensor;

    setUp(() {
      testSensor = Sensor(
        id: 'test-sensor-1',
        location: 'Test Location',
        temperature: 25.5,
        humidity: 60.0,
        pressure: 1013.25,
        timestamp: DateTime.now(),
      );
    });

    testWidgets('should display correct app bar title', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ProviderScope(child: DetailsScreen(sensor: testSensor)),
        ),
      );

      expect(find.text('Sensor Details'), findsOneWidget);
    });

    testWidgets('should display DetailCard widget', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ProviderScope(child: DetailsScreen(sensor: testSensor)),
        ),
      );

      expect(find.byType(DetailCard), findsOneWidget);
    });

    testWidgets('should display BubbleChart widget', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ProviderScope(child: DetailsScreen(sensor: testSensor)),
        ),
      );

      expect(find.byType(BubbleChart), findsOneWidget);
    });

    testWidgets('should display all SummaryCards with correct data', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ProviderScope(child: DetailsScreen(sensor: testSensor)),
        ),
      );

      // Verify all SummaryCards are present
      expect(find.byType(SummaryCard), findsNWidgets(4));

      // Verify temperature card
      expect(find.text('TEMPERATURE'), findsOneWidget);
      expect(find.text('25.50 °C'), findsOneWidget);

      // Verify humidity card
      expect(find.text('HUMIDITY'), findsOneWidget);
      expect(find.text('60.00 %'), findsOneWidget);

      // Verify pressure card
      expect(find.text('PRESSURE'), findsOneWidget);
      expect(find.text('1013.25 hPa'), findsOneWidget);

      // Verify anomaly level card
      expect(find.text('ANOMALY LEVEL'), findsOneWidget);
      expect(find.text('Attention Needed'), findsOneWidget);
    });

    testWidgets('should display correct anomaly values', (
      WidgetTester tester,
    ) async {
      // Create a sensor with known anomaly values
      final sensorWithAnomalies = Sensor(
        id: 'test-sensor-2',
        location: 'Test Location',
        temperature: 40.0, // High temperature
        humidity: 90.0, // High humidity
        pressure: 1100.0, // High pressure
        timestamp: DateTime.now(),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: ProviderScope(
            child: DetailsScreen(sensor: sensorWithAnomalies),
          ),
        ),
      );

      // Verify anomaly values are displayed
      expect(find.textContaining('ANOMALY:'), findsNWidgets(3));
    });

    testWidgets('should maintain correct layout on different screen sizes', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ProviderScope(child: DetailsScreen(sensor: testSensor)),
        ),
      );

      // Verify the GridView is present
      expect(find.byType(GridView), findsOneWidget);

      // Verify the layout contains a ListView
      expect(find.byType(ListView), findsOneWidget);
    });
  });
}
