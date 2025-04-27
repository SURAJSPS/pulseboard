import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulseboard/application/dashboard/sensor_controller.dart';

class BubbleSizeToggle extends ConsumerWidget {
  const BubbleSizeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sensorControllerProvider);

    return SegmentedButton<BubbleToggle>(
      segments: const [
        ButtonSegment<BubbleToggle>(
          value: BubbleToggle.humidity,
          label: Text('Humidity'),
          icon: Icon(Icons.water_drop),
        ),
        ButtonSegment<BubbleToggle>(
          value: BubbleToggle.pressure,
          label: Text('Pressure'),
          icon: Icon(Icons.compress),
        ),
      ],
      selected: {
        state.bubbleToggle == BubbleToggle.humidity
            ? BubbleToggle.humidity
            : BubbleToggle.pressure,
      },
      onSelectionChanged: (Set<BubbleToggle> newSelection) {
        ref.read(sensorControllerProvider.notifier).toggleBubbleSize();
      },
    );
  }
}
