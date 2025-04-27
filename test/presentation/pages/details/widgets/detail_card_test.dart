import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pulseboard/domain/entities/sensor.dart';
import 'package:pulseboard/presentation/pages/details/widgets/detail_card.dart';

void main() {
  group('DetailCard Tests', () {
    late Sensor testSensor;
    late DateTime testTimestamp;

    setUp(() {
      testTimestamp = DateTime(2024, 4, 27, 14, 30, 0);
      testSensor = Sensor(
        id: 'test-sensor-1',
        location: 'Test Location',
        temperature: 25.5,
        humidity: 60.0,
        pressure: 1013.25,
        timestamp: testTimestamp,
      );
    });

    testWidgets('should display sensor location', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: DetailCard(testSensor))),
      );

      expect(
        find.text('Test Location'),
        findsNWidgets(2),
      ); // Appears twice in the widget
    });

    testWidgets('should display sensor ID', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: DetailCard(testSensor))),
      );

      expect(
        find.text('Sensor ID: test-sensor-1'),
        findsNWidgets(2),
      ); // Appears twice in the widget
    });

    testWidgets('should maintain correct layout structure', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: DetailCard(testSensor))),
      );

      // Verify Card widget
      expect(find.byType(Card), findsOneWidget);

      // Verify Row layout
      expect(find.byType(Row), findsOneWidget);

      // Verify three Flexible widgets (one for each column)
      expect(find.byType(Flexible), findsNWidgets(3));

      // Verify Column widgets
      expect(find.byType(Column), findsNWidgets(2));
    });

    testWidgets('should handle different sensor states', (
      WidgetTester tester,
    ) async {
      // Test with high anomaly values
      final highAnomalySensor = Sensor(
        id: 'test-sensor-2',
        location: 'High Anomaly Location',
        temperature: 40.0,
        humidity: 90.0,
        pressure: 1100.0,
        timestamp: testTimestamp,
      );

      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: DetailCard(highAnomalySensor))),
      );

      // Verify the widget still renders correctly with different values
      expect(find.text('High Anomaly Location'), findsNWidgets(2));
      expect(find.text('Sensor ID: test-sensor-2'), findsNWidgets(2));
    });

    testWidgets('should maintain proper padding and spacing', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: DetailCard(testSensor))),
      );

      // Verify the main container padding
      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.padding, const EdgeInsets.all(16));

      // Verify spacing between elements
      expect(
        find.byType(SizedBox),
        findsNWidgets(4),
      ); // Two SizedBox widgets, each appearing twice
    });
  });
}
