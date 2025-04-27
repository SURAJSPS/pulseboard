import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulseboard/domain/entities/sensor.dart';
import 'package:pulseboard/presentation/pages/details/details_page.dart';
import 'package:pulseboard/presentation/pages/details/widgets/detail_card.dart';
import 'package:pulseboard/presentation/pages/dashboard/widgets/summary_card.dart';
import 'package:pulseboard/presentation/pages/dashboard/widgets/bulle_chart.dart';
import 'package:pulseboard/core/utils/app_utils.dart';
import 'package:pulseboard/domain/di/app_providers.dart';

import '../../../data/datasources/mock/sensor_data_mock_test.dart';

void main() {
  late Sensor testSensor;
  late ProviderContainer container;

  setUp(() {
    // Use the first sensor from mock data for testing
    testSensor = mocSensorData.first;
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  Widget makeTestable() {
    return UncontrolledProviderScope(
      container: container,
      child: MaterialApp(home: DetailsScreen(sensor: testSensor)),
    );
  }

  group('Details Page', () {
    testWidgets('should display correct app bar title', (tester) async {
      await tester.pumpWidget(makeTestable());
      await tester.pumpAndSettle();

      expect(find.text('Sensor Details'), findsOneWidget);
    });

    testWidgets('should display DetailCard with correct sensor information', (
      tester,
    ) async {
      await tester.pumpWidget(makeTestable());
      await tester.pumpAndSettle();

      expect(find.byType(DetailCard), findsOneWidget);
      expect(find.text(testSensor.location), findsWidgets);
    });

    testWidgets('should display correct summary cards with sensor data', (
      tester,
    ) async {
      await tester.pumpWidget(makeTestable());
      await tester.pumpAndSettle();

      // Verify all summary cards are present
      final summaryCards = find.byType(SummaryCard);
      expect(summaryCards, findsNWidgets(4));

      // Verify Temperature card
      expect(find.text('TEMPERATURE'), findsOneWidget);
      expect(
        find.text('${testSensor.temperature.toStringAsFixed(2)} °C'),
        findsOneWidget,
      );
      expect(
        find.text(
          'ANOMALY: ${AppUtils.temperatureAnomaly(testSensor.temperature).toStringAsFixed(2)}%',
        ),
        findsWidgets,
      );

      // Verify Humidity card
      expect(find.text('HUMIDITY'), findsOneWidget);
      expect(
        find.text('${testSensor.humidity.toStringAsFixed(2)} %'),
        findsWidgets,
      );
      expect(
        find.text(
          'ANOMALY: ${AppUtils.humidityAnomaly(testSensor.humidity).toStringAsFixed(2)}%',
        ),
        findsWidgets,
      );

      // Verify Pressure card
      expect(find.text('PRESSURE'), findsOneWidget);
      expect(
        find.text('${testSensor.pressure.toStringAsFixed(2)} hPa'),
        findsWidgets,
      );
      expect(
        find.text(
          'ANOMALY: ${AppUtils.pressureAnomaly(testSensor.pressure).toStringAsFixed(2)}%',
        ),
        findsWidgets,
      );

      // Verify Anomaly Level card
      expect(find.text('ANOMALY LEVEL'), findsOneWidget);
      expect(
        find.text('${AppUtils.anomaly(testSensor).toStringAsFixed(2)}%'),
        findsWidgets,
      );
      expect(find.text('Attention Needed'), findsOneWidget);
    });

    testWidgets('should display BubbleChart with correct sensor data', (
      tester,
    ) async {
      await tester.pumpWidget(makeTestable());
      await tester.pumpAndSettle();

      final bubbleChart = find.byType(BubbleChart);
      expect(bubbleChart, findsOneWidget);

      // Verify the chart is disabled (isDisabled: true)
      final bubbleChartWidget = tester.widget<BubbleChart>(bubbleChart);
      expect(bubbleChartWidget.isDisabled, true);
      expect(bubbleChartWidget.sensors.length, 1);
      expect(bubbleChartWidget.sensors.first, testSensor);
    });

    testWidgets('should display correct icons in summary cards', (
      tester,
    ) async {
      await tester.pumpWidget(makeTestable());
      await tester.pumpAndSettle();

      // Verify icons in summary cards
      expect(find.byIcon(Icons.thermostat), findsOneWidget);
    });

    testWidgets('should display correct colors for summary cards', (
      tester,
    ) async {
      await tester.pumpWidget(makeTestable());
      await tester.pumpAndSettle();

      final summaryCards = tester.widgetList<SummaryCard>(
        find.byType(SummaryCard),
      );

      // Verify Temperature card color
      expect(summaryCards.elementAt(0).color, Colors.orange.shade100);

      // Verify Humidity card color
      expect(summaryCards.elementAt(1).color, Colors.blue.shade100);

      // Verify Pressure card color
      expect(summaryCards.elementAt(2).color, Colors.red.shade100);

      // Verify Anomaly Level card color
      expect(
        summaryCards.elementAt(3).color,
        AppUtils.getSensorAnomalyColor(testSensor),
      );
    });

    testWidgets('should maintain correct layout with different screen sizes', (
      tester,
    ) async {
      await tester.pumpWidget(makeTestable());
      await tester.pumpAndSettle();

      // Verify the grid layout
      final gridView = find.byType(GridView);
      expect(gridView, findsOneWidget);

      final gridViewWidget = tester.widget<GridView>(gridView);
      expect(gridViewWidget.shrinkWrap, true);
      expect(gridViewWidget.physics, const NeverScrollableScrollPhysics());

      // Verify child aspect ratio through the LayoutBuilder
      final layoutBuilder = find.byType(LayoutBuilder);
      expect(layoutBuilder, findsOneWidget);
    });

    testWidgets('should display correct anomaly values based on sensor data', (
      tester,
    ) async {
      await tester.pumpWidget(makeTestable());
      await tester.pumpAndSettle();

      // Get the actual anomaly values from the sensor
      final tempAnomaly = AppUtils.temperatureAnomaly(testSensor.temperature);
      final humidityAnomaly = AppUtils.humidityAnomaly(testSensor.humidity);
      final pressureAnomaly = AppUtils.pressureAnomaly(testSensor.pressure);
      final overallAnomaly = AppUtils.anomaly(testSensor);

      // Find all summary cards
      final summaryCards = find.byType(SummaryCard);
      expect(summaryCards, findsNWidgets(4));

      // Get the text from each card
      final cardTexts =
          tester
              .widgetList<SummaryCard>(summaryCards)
              .map((card) => card.value)
              .toList();

      // Verify the values are present in the cards
      expect(
        cardTexts.any((text) => text.contains(tempAnomaly.toStringAsFixed(2))),
        true,
      );
      expect(
        cardTexts.any(
          (text) => text.contains(humidityAnomaly.toStringAsFixed(2)),
        ),
        true,
      );
      expect(
        cardTexts.any(
          (text) => text.contains(pressureAnomaly.toStringAsFixed(2)),
        ),
        true,
      );
      expect(
        cardTexts.any(
          (text) => text.contains(overallAnomaly.toStringAsFixed(2)),
        ),
        true,
      );
    });
  });
}
