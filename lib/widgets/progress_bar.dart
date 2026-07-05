import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double progress;
  final Color color;
  final double height;
  final double borderRadius;

  const ProgressBar({
    super.key,
    required this.progress,
    this.color = Colors.blue,
    this.height = 12,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width *
                0.6 *
                progress.clamp(0.0, 1.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color, color.withValues(alpha: 0.7)],
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ],
      ),
    );
  }
}
