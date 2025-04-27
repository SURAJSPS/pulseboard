import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;
  final IconData? icon;
  final Color? color;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    this.icon,
    this.color,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      color: color ?? Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildText(title, style: textTheme.titleSmall!),
                  _buildText(value, style: textTheme.headlineMedium!),
                  if (subtitle != null) ...[
                    const SizedBox(height: 8),
                    _buildText(subtitle!, style: textTheme.titleSmall!),
                  ],
                ],
              ),
            ),
            Icon(icon, size: 32, color: Colors.black54),
          ],
        ),
      ),
    );
  }

  _buildText(String title, {required TextStyle style}) {
    return Flexible(
      child: Text(
        title,
        style: style,
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
