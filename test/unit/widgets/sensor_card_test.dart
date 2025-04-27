import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pulseboard/domain/entities/sensor.dart';
import 'package:pulseboard/presentation/pages/dashboard/widgets/bulle_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('SensorCard displays correct data', (tester) async {
    final sensor = Sensor(
      id: '1',
      location: 'Line A',
      timestamp: DateTime.now(),
      temperature: 30.0,
      humidity: 50.0,
      pressure: 1000.0,
      isOnline: true,
    );

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(body: BubbleChart(sensors: [sensor])),
        ),
      ),
    );

    // Wait for all animations and async work to finish
    await tester.pumpAndSettle();

    // Print all Text widgets to debug
    debugPrint(tester.widgetList(find.byType(Text)).toString());

    expect(find.text('Line A'), findsOneWidget);
    expect(find.text('30.0°C'), findsOneWidget);
    expect(find.text('Online'), findsOneWidget);
  });
}
