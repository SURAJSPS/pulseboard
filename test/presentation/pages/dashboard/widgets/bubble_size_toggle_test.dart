// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:pulseboard/presentation/pages/dashboard/widgets/bubble_size_toggle.dart';
// import 'package:pulseboard/presentation/providers/sensor_provider.dart';

// class MockSensorNotifier extends Mock implements SensorDataNotifier {}

// void main() {
//   testWidgets('BubbleSizeToggle changes selection when tapped', (tester) async {
//     final mockNotifier = MockSensorNotifier();

//     await tester.pumpWidget(
//       ProviderScope(
//         overrides: [
//           sensorDataNotifierProvider.overrideWith(
//             () => mockNotifier as SensorDataNotifier,
//           ),
//         ],
//         child: MaterialApp(home: Scaffold(body: const BubbleSizeToggle())),
//       ),
//     );

//     // Initial state (humidity selected)
//     expect(find.text('Humidity'), findsOneWidget);
//     expect(find.text('Pressure'), findsOneWidget);

//     // Tap the pressure segment
//     await tester.tap(find.text('Pressure'));
//     await tester.pump();

//     verify(mockNotifier.toggleBubbleSize()).called(1);
//   });
// }
