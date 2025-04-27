import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pulseboard/presentation/pages/dashboard/widgets/summary_card.dart';

void main() {
  testWidgets('SummaryCard displays correct information', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SummaryCard(
            title: 'Active Sensors',
            value: '5/10',
            subtitle: '5 Offline',
            icon: Icons.sensors,
            color: Colors.blue.shade100,
          ),
        ),
      ),
    );

    expect(find.text('Active Sensors'), findsOneWidget);
    expect(find.text('5/10'), findsOneWidget);
    expect(find.text('5 Offline'), findsOneWidget);
    expect(find.byIcon(Icons.sensors), findsOneWidget);
  });

  testWidgets('SummaryCard handles missing optional fields', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SummaryCard(
            title: 'Temperature',
            value: '25°C',
          ),
        ),
      ),
    );

    expect(find.text('Temperature'), findsOneWidget);
    expect(find.text('25°C'), findsOneWidget);
    expect(find.byType(IconTheme), findsWidgets);
  });
}