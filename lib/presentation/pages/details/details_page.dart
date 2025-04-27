import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulseboard/core/utils/app_utils.dart';
import 'package:pulseboard/domain/entities/sensor.dart';
import 'package:pulseboard/presentation/pages/dashboard/widgets/summary_card.dart';
import 'package:pulseboard/presentation/pages/details/widgets/detail_card.dart';

import '../dashboard/widgets/bulle_chart.dart';

@RoutePage()
class DetailsScreen extends ConsumerWidget {
  final Sensor sensor;
  const DetailsScreen({super.key, required this.sensor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  
    return Scaffold(
      appBar: AppBar(title: Text('Sensor Details')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          DetailCard(sensor),
          buildSummaryDetail(),
          BubbleChart(isDisabled: true, sensors: [sensor]),
        ],
      ),
    );
  }

  Widget buildSummaryDetail() {
    return LayoutBuilder(
      builder: (context,constraints) {
        return GridView.count(
          // Adjusts card aspect ratio based on screen width
          childAspectRatio: (constraints.maxWidth / 4) / 140,
          // Fixed aspect ratio for consistency
          crossAxisCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SummaryCard(
              icon: Icons.thermostat,
              color: Colors.orange.shade100,
              title: "TEMPERATURE",
              value: "${sensor.temperature.toStringAsFixed(2)} °C",
              subtitle:
                  'ANOMALY: ${AppUtils.temperatureAnomaly(sensor.temperature).toStringAsFixed(2)}%',
            ),
            SummaryCard(
              // icon: Icons.hum,
              color: Colors.blue.shade100,
              title: 'HUMIDITY',
              value: "${sensor.humidity.toStringAsFixed(2)} %",
              subtitle:
                  'ANOMALY: ${AppUtils.humidityAnomaly(sensor.humidity).toStringAsFixed(2)}%',
            ),
            SummaryCard(
              // icon: Icons.warning_amber_rounded,
              color: Colors.red.shade100,
              title: "PRESSURE",
              value: "${sensor.pressure.toStringAsFixed(2)} hPa",
              subtitle:
                  'ANOMALY: ${AppUtils.pressureAnomaly(sensor.pressure).toStringAsFixed(2)}%',
            ),

            SummaryCard(
              // icon: Icons.warning_amber_rounded,
              color: AppUtils.getSensorAnomalyColor(sensor),
              title: "ANOMALY LEVEL",
              value: "${AppUtils.anomaly(sensor).toStringAsFixed(2)}%",
              subtitle: 'Attention Needed',
            ),
          ],
        );
      }
    );
  }
}
