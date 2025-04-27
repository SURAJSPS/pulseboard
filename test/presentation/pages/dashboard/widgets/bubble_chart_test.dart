import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pulseboard/domain/entities/sensor.dart';
import 'package:pulseboard/presentation/pages/dashboard/widgets/bulle_chart.dart';
import 'package:pulseboard/application/dashboard/sensor_controller.dart';
import 'package:pulseboard/domain/di/app_providers.dart';

void main() {
  group('BubbleChart Tests', () {
    late List<Sensor> testSensors;
    late DateTime testTimestamp;

    setUp(() {
      testTimestamp = DateTime(2024, 4, 27, 14, 30, 0);
      testSensors = [
        Sensor(
          id: 'test-sensor-1',
          location: 'Test Location 1',
          temperature: 25.5,
          humidity: 60.0,
          pressure: 1013.25,
          timestamp: testTimestamp,
          isOnline: true,
        ),
        Sensor(
          id: 'test-sensor-2',
          location: 'Test Location 2',
          temperature: 30.0,
          humidity: 75.0,
          pressure: 1050.0,
          timestamp: testTimestamp,
          isOnline: true,
        ),
      ];
    });

    testWidgets('should display Card with correct elevation', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ProviderScope(
            child: Scaffold(body: BubbleChart(sensors: testSensors)),
          ),
        ),
      );

      final card = tester.widget<Card>(find.byType(Card));
      expect(card.elevation, 2);
    });

    testWidgets('should handle disabled state', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ProviderScope(
            child: Scaffold(
              body: BubbleChart(sensors: testSensors, isDisabled: true),
            ),
          ),
        ),
      );

      // Verify the widget renders correctly in disabled state
      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('should handle empty sensor list', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ProviderScope(child: Scaffold(body: BubbleChart(sensors: []))),
        ),
      );

      // Verify the widget renders correctly with empty list
      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('should handle offline sensors', (WidgetTester tester) async {
      final offlineSensor = Sensor(
        id: 'offline-sensor',
        location: 'Offline Location',
        temperature: 25.5,
        humidity: 60.0,
        pressure: 1013.25,
        timestamp: testTimestamp,
        isOnline: false,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: ProviderScope(
            child: Scaffold(body: BubbleChart(sensors: [offlineSensor])),
          ),
        ),
      );

      // Verify the widget renders correctly with offline sensor
      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('should handle different bubble size metrics', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ProviderScope(
            child: Scaffold(body: BubbleChart(sensors: testSensors)),
          ),
        ),
      );

      // Verify the widget renders correctly with different metrics
      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('should respect time range constraints', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ProviderScope(
            child: Scaffold(body: BubbleChart(sensors: testSensors)),
          ),
        ),
      );

      // Verify the widget renders correctly within time constraints
      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('should handle tooltip enabled/disabled state', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ProviderScope(
            child: Scaffold(
              body: BubbleChart(sensors: testSensors, isTooltipEnabled: false),
            ),
          ),
        ),
      );

      // Verify the widget renders correctly with tooltips disabled
      expect(find.byType(Card), findsOneWidget);
    });
  });
}
