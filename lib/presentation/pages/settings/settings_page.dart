import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulseboard/application/dashboard/sensor_controller.dart';

@RoutePage()
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Example Riverpod state providers (replace with your actual providers)
    final simulateOffline = ref.watch(sensorControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Sensor Options',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            const Divider(),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.refresh),
                label: const Text('Refresh Data'),
                onPressed: () {
                  ref.watch(sensorControllerProvider.notifier).refreshData();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Data refreshed!')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
