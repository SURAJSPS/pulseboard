import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:pulseboard/domain/entities/sensor.dart';
import 'package:pulseboard/presentation/pages/dashboard/widgets/bubble.dart';

class CustomChart extends StatelessWidget {
  final List<Sensor> sensors;
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

  const CustomChart({
    super.key,
    required this.sensors,
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
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(width, height),
            painter: _ChartPainter(
              minTemp: minTemp,
              maxTemp: maxTemp,
              minTime: minTime,
              maxTime: maxTime,
            ),
          ),

          ...sensors.map(
            (sensor) => Bubble(
              isTooltipEnabled: isTooltipEnabled,
              key: Key(sensor.id),
              sensor: sensor,
              height: height,
              width: width,
              getBubbleSize: getBubbleSize,
              getBubbleColor: getBubbleColor,
              onBubbleTap: onBubbleTap,
              minTime: minTime,
              maxTime: maxTime,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartPainter extends CustomPainter {
  final double minTemp;
  final double maxTemp;
  final DateTime minTime;
  final DateTime maxTime;

  _ChartPainter({
    // required this.sensors,
    required this.minTemp,
    required this.maxTemp,
    required this.minTime,
    required this.maxTime,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.grey.withOpacity(0.5)
          ..strokeWidth = 1;

    // Draw grid lines (Y)
    for (int i = 0; i <= 4; i++) {
      final y = 20 + (size.height - 60) * (i / 4);
      canvas.drawLine(Offset(60, y), Offset(size.width - 40, y), paint);
      // Y-axis labels
      final temp = maxTemp - (i * (maxTemp - minTemp) / 4);
      final tp = TextPainter(
        text: TextSpan(
          text: '${temp.toInt()}°C',
          style: TextStyle(color: Colors.grey[700], fontSize: 12),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(10, y - tp.height / 2));
    }

    // Draw grid lines (X)
    for (int i = 0; i <= 5; i++) {
      final x = 60 + (size.width - 100) * (i / 5);
      canvas.drawLine(Offset(x, 20), Offset(x, size.height - 40), paint);
      // X-axis labels
      final time = minTime.add(
        Duration(
          milliseconds:
              ((maxTime.difference(minTime).inMilliseconds) * (i / 5)).round(),
        ),
      );
      final tp = TextPainter(
        text: TextSpan(
          text: DateFormat('HH:mm').format(time),
          style: TextStyle(color: Colors.grey[700], fontSize: 12),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(x - tp.width / 2, size.height - 30));
    }

    // Draw axis titles
    final yTitle = TextPainter(
      text: const TextSpan(
        text: 'Temperature (°C)',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13,
          color: Colors.black,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    canvas.save();

    // Move to rotation point and rotate -90 degrees (π/2 radians)
    canvas.translate(
      50,
      size.height / 2,
    ); // Adjust 50 for padding from left edge
    canvas.rotate(-1.5708); // -90 degrees in radians

    // Paint the rotated text (note we use width for vertical centering)
    yTitle.paint(canvas, Offset(0, -yTitle.width / 2));

    // Restore canvas to normal state
    canvas.restore();

    final xTitle = TextPainter(
      text: const TextSpan(
        text: 'Time',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13,
          color: Colors.black,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    xTitle.paint(
      canvas,
      Offset(size.width / 2 - xTitle.width / 2, size.height - 15),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
