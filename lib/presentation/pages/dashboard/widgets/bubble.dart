import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:pulseboard/core/utils/app_utils.dart';
import 'package:pulseboard/domain/entities/sensor.dart';

class Bubble extends StatelessWidget {
  final Sensor sensor;
  final double height;
  final double width;
  final double minTemp;
  final double maxTemp;
  final DateTime minTime;
  final DateTime maxTime;
  final double Function(Sensor) getBubbleSize;
  final Color Function(Sensor) getBubbleColor;
  final void Function(BuildContext, Sensor) onBubbleTap;
  final bool isTooltipEnabled;

  const Bubble({
    super.key,
    required this.sensor,
    required this.height,
    required this.width,
    required this.getBubbleSize,
    required this.getBubbleColor,
    required this.onBubbleTap,
    this.minTemp = 0,
    this.maxTemp = 100,
    required this.minTime,
    required this.maxTime,
    this.isTooltipEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final x = _getX(sensor);
    final y = _getY(sensor);
    final bubbleSize = getBubbleSize(sensor);
    return Positioned(
      left: x - bubbleSize / 2,
      top: y - bubbleSize / 2,
      child: GestureDetector(
        onTap: () => onBubbleTap(context, sensor),
        child:
            isTooltipEnabled
                ? Tooltip(
                  triggerMode: TooltipTriggerMode.longPress,
                  enableFeedback: false,
                  message: _buildTooltipMessage(sensor),
                  preferBelow: false,
                  verticalOffset: bubbleSize / 2,
                  child: _buildBubble(bubbleSize),
                )
                : _buildBubble(bubbleSize),
      ),
    );
  }

  Widget _buildBubble(double bubbleSize) {
    return Container(
      width: bubbleSize,
      height: bubbleSize,
      decoration: BoxDecoration(
        color: getBubbleColor(sensor),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child:
          !sensor.isOnline
              ? Center(
                child: Text(
                  '?',
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: bubbleSize / 2.5,
                  ),
                ),
              )
              : null,
    );
  }

  String _buildTooltipMessage(Sensor sensor) {
    return "Location: ${sensor.location}\nTemperature: ${sensor.temperature.toStringAsFixed(2)}b0C\nPressure: ${sensor.pressure.toStringAsFixed(2)} hPa\nHumidity: ${sensor.humidity.toStringAsFixed(2)}%\nStatus: ${sensor.isOnline ? 'Online' : 'Offline'}\nTimes: ${AppUtils.time(sensor.timestamp)}\nTimes: ${AppUtils.date(sensor.timestamp)}";
  }

  double _getX(Sensor sensor) {
    final totalMillis = maxTime.difference(minTime).inMilliseconds;
    final sensorMillis = (sensor.timestamp).difference(minTime).inMilliseconds;
    final percent = sensorMillis.clamp(0, totalMillis) / totalMillis;
    return 60 + (width - 137) * percent; // 60 left padding, 40 right
  }

  double _getY(Sensor sensor) {
    final temp = sensor.temperature;
    final percent = ((temp - minTemp) / (maxTemp - minTemp)).clamp(0.0, 1.0);
    return 20 + (height - 60) * (1 - percent); // 20 top, 40 bottom
  }
}
