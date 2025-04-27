import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulseboard/application/dashboard/sensor_controller.dart';
import 'package:pulseboard/presentation/pages/dashboard/widgets/bulle_chart.dart';
import 'package:pulseboard/presentation/pages/dashboard/widgets/summary_card.dart';

import 'package:pulseboard/presentation/pages/dashboard/widgets/bubble_size_toggle.dart';

@RoutePage()
class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sensorControllerProvider);

    Widget buildSummaryCards() {
      return Container(
        constraints: const BoxConstraints(maxHeight: 200),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return GridView.count(
              // Adjusts card aspect ratio based on screen width
              childAspectRatio: (constraints.maxWidth / 3) / 150,
              // Fixed aspect ratio for consistency
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                SummaryCard(
                  icon: Icons.sensors,
                  color: Colors.blue.shade100,
                  title: 'Active Sensors',
                  value: "${state.activeSensors} / ${state.totalSensors}",
                  subtitle: "${state.inActiveSensors} Offline",
                ),
                SummaryCard(
                  icon: Icons.warning_amber_rounded,
                  color: Colors.red.shade100,
                  title: 'Critical Alert',
                  value: state.criticalAlerts.toString(),
                  subtitle: 'Attention Needed',
                ),
                SummaryCard(
                  icon: Icons.thermostat,
                  color: Colors.orange.shade100,
                  title: 'Avg. Temperature',
                  value: "${state.avgTemp.toStringAsFixed(2)} °C",
                  subtitle:
                      state.avgTemp > 40
                          ? '${state.aboveNormalTemp} High'
                          : 'Normal',
                ),
              ],
            );
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Pulseboard Dashboard')),
      body: Builder(
        builder: (context) {
          if (state.status == Status.loading ||
              state.status == Status.initial) {
            // Show loading indicator while data is being fetched
            return const Center(child: Column(
              children: [
                SizedBox(height: 100),
                Text('Loading data...'),
                SizedBox(height: 16),
                CircularProgressIndicator(
                  key: Key("Loading data..."),
                ),
              ],
            ));
          }
          if (state.status == Status.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, color: Colors.red, size: 48),
                  const SizedBox(height: 8),
                  Text(
                    key: Key("Error message"),
                    state.errorMessage ?? 'Error loading data'),
                ],
              ),
            );
          } else if (state.sensors.isNotEmpty) {
           return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                buildSummaryCards(),
                const SizedBox(height: 24),
                Column(
                  children: [
                    const BubbleSizeToggle(),
                    // const SizedBox(height: 8),
                    BubbleChart(sensors: state.sensors,
                     
                      isTooltipEnabled: false,
                    ),
                  ],
                ),
              ],
            );
          }
          return  const Center(
            child: Text('No data available'),
          );
        },
      ),
    );
  }
}
