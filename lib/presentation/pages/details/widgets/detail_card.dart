import 'package:flutter/material.dart';
import 'package:pulseboard/core/utils/app_utils.dart';
import 'package:pulseboard/domain/entities/sensor.dart';

class DetailCard extends StatelessWidget {
  final Sensor sensor;
  const DetailCard(this.sensor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade100,
      child: Container(
        padding: const EdgeInsets.all(16),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
            child: Container(
              width: 100, // Adjust size as needed
              height: 100, // Adjust size as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppUtils.getSensorAnomalyColor(sensor),
                  width: 3.0, // Border width
                ),
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: AppUtils.getSensorAnomalyColor(
                  sensor,
                ).withOpacity(0.5),
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: AppUtils.getSensorAnomalyColor(sensor),
                ),
              ),
            ),
                  ),
            // const SizedBox(width: 25),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(sensor.location),
                  SizedBox(height: 8),
                  Text('Sensor ID: ${sensor.id}'),
                  SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      text: 'Last Updated: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: AppUtils.date(sensor.timestamp),
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),

                        TextSpan(
                          text: " ${AppUtils.time(sensor.timestamp)}",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(sensor.location),
                  SizedBox(height: 8),
                  Text('Sensor ID: ${sensor.id}'),
                  SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      text: 'Last Updated: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: AppUtils.date(sensor.timestamp),
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),

                        TextSpan(
                          text: " ${AppUtils.time(sensor.timestamp)}",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
