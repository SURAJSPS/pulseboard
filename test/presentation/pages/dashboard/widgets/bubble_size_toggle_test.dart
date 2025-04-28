import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pulseboard/presentation/pages/dashboard/widgets/bubble_size_toggle.dart';


void main() {
  testWidgets('BubbleSizeToggle displays segments and toggles selection', (WidgetTester tester) async {
    // Create a ProviderContainer for testing
    final container = ProviderContainer(
      overrides: [
        // You may need to override sensorControllerProvider with a mock or test implementation
        // sensorControllerProvider.overrideWithValue(...)
      ],
    );

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          home: Scaffold(
            body: BubbleSizeToggle(),
          ),
        ),
      ),
    );

    // Verify both segments are present
    expect(find.text('Humidity'), findsOneWidget);
    expect(find.text('Pressure'), findsOneWidget);

    // Tap on the "Pressure" segment
    await tester.tap(find.text('Pressure'));
    await tester.pumpAndSettle();

   
  });
}