// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:pulseboard/domain/entities/sensor.dart';
// import 'package:pulseboard/presentation/pages/dashboard/widgets/bulle_chart.dart';
// import 'package:pulseboard/presentation/pages/dashboard/widgets/custom_bubble_chart.dart';
// import 'package:pulseboard/presentation/providers/sensor_provider.dart';

// import 'bubble_chart_test.mocks.dart';

// final mockSensors = [
//   Sensor(
//     id: '1',
//     location: 'Line A',
//     timestamp: DateTime.now(),
//     temperature: 25.0,
//     humidity: 50.0,
//     pressure: 1000.0,
//     isOnline: true,
//   ),
//   Sensor(
//     id: '2',
//     location: 'Line B',
//     timestamp: DateTime.now(),
//     temperature: 30.0,
//     humidity: 60.0,
//     pressure: 1010.0,
//     isOnline: false,
//   ),
// ];

// @GenerateMocks([SensorDataNotifier])
// void main() {
//   testWidgets('BubbleChart renders correct number of bubbles', (tester) async {
//     final mockNotifier = MockSensorDataNotifier();

//     when(mockNotifier.state).thenReturn(
//       SensorState.initial().copyWith(
//         sensors: mockSensors,
//         bubbleToggle: BubbleToggle.humidity,
//       ),
//     );

//     await tester.pumpWidget(
//       ProviderScope(
//         overrides: [
//           sensorDataNotifierProvider.overrideWith(() => mockNotifier),
//         ],
//         child: MaterialApp(
//           home: Scaffold(body: BubbleChart(sensors: mockSensors)),
//         ),
//       ),
//     );

//     expect(find.byType(CustomChart), findsOneWidget);
//     expect(find.byType(Tooltip), findsNWidgets(mockSensors.length));
//   });

//   testWidgets('BubbleChart shows offline indicators', (tester) async {
//     final mockNotifier = MockSensorDataNotifier();

//     when(mockNotifier.state).thenReturn(
//       SensorState.initial().copyWith(
//         sensors: mockSensors,
//         bubbleToggle: BubbleToggle.humidity,
//       ),
//     );

//     await tester.pumpWidget(
//       ProviderScope(
//         overrides: [
//           sensorDataNotifierProvider.overrideWith(() => mockNotifier),
//         ],
//         child: MaterialApp(
//           home: Scaffold(body: BubbleChart(sensors: mockSensors)),
//         ),
//       ),
//     );

//     expect(find.text('?'), findsOneWidget);
//   });
// }
