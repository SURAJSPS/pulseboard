import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pulseboard/domain/di/app_providers.dart';
import 'package:pulseboard/core/routes/app_router.gr.dart';
import 'package:pulseboard/core/utils/app_utils.dart';
import 'package:pulseboard/domain/entities/sensor.dart';
import 'package:pulseboard/application/dashboard/sensor_controller.dart';
import 'package:pulseboard/presentation/pages/dashboard/widgets/custom_bubble_chart.dart';

class BubbleChart extends ConsumerWidget {
  final List<Sensor> sensors;
  final bool isDisabled;
  final bool isTooltipEnabled;

  const BubbleChart({
    super.key,
    required this.sensors,
    this.isDisabled = false,
    this.isTooltipEnabled = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Read the current bubble size metric from the provider
    final state = ref.watch(sensorControllerProvider);

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomChart(
          isTooltipEnabled: isTooltipEnabled,
          sensors: sensors,
          height: 500,
          width: MediaQuery.of(context).size.width - 32,
          minTime: DateTime.now().copyWith(hour: 8, minute: 0),
          maxTime: DateTime.now().copyWith(hour: 18, minute: 0),
          getBubbleSize: (sensor) {
            if (!sensor.isOnline) return 30;

            // Set bubble size based on selected metric
            if (state.bubbleToggle == BubbleToggle.humidity) {
              // Ensure bubble size reflects humidity value (20-100 size range)
              final humidity = sensor.humidity.isNaN ? 0 : sensor.humidity;
              return 20 + (humidity * 0.4); // More pronounced scaling
            } else {
              // For pressure metric (900-1100 hPa typical range)
              final pressure = sensor.pressure.isNaN ? 0 : sensor.pressure;
              // Map pressure from typical 900-1100 range to 20-100 size range
              return 20 + ((pressure - 900).clamp(0, 200) / 200) * 40;
            }
          },
          getBubbleColor: (sensor) => AppUtils.getSensorAnomalyColor(sensor),
          onBubbleTap:
              (context, sensor) =>
                  isDisabled
                      ? null
                      : ref
                          .read(routerProvider)
                          .push(DetailsRoute(sensor: sensor)),
        ),
      ),
    );
  }
}
