import 'package:flutter/material.dart';

class QuizOption extends StatelessWidget {
  final String option;
  final bool isSelected;
  final bool isCorrect;
  final bool isAnswered;
  final VoidCallback onTap;

  const QuizOption({
    super.key,
    required this.option,
    required this.isSelected,
    required this.isCorrect,
    required this.isAnswered,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color getColor() {
      if (!isAnswered) return Colors.grey.shade100;
      if (isSelected && isCorrect) return Colors.green.shade100;
      if (isSelected && !isCorrect) return Colors.red.shade100;
      if (!isSelected && isCorrect) return Colors.green.shade50;
      return Colors.grey.shade100;
    }

    Color getBorderColor() {
      if (!isAnswered) return Colors.grey.shade300;
      if (isSelected && isCorrect) return Colors.green;
      if (isSelected && !isCorrect) return Colors.red;
      if (!isSelected && isCorrect) return Colors.green;
      return Colors.grey.shade300;
    }

    IconData? getIcon() {
      if (!isAnswered) return null;
      if (isSelected && isCorrect) return Icons.check_circle;
      if (isSelected && !isCorrect) return Icons.cancel;
      if (!isSelected && isCorrect) return Icons.check_circle_outline;
      return null;
    }

    Color getIconColor() {
      if (isSelected && isCorrect) return Colors.green;
      if (isSelected && !isCorrect) return Colors.red;
      if (!isSelected && isCorrect) return Colors.green;
      return Colors.grey;
    }

    return GestureDetector(
      onTap: isAnswered ? null : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: getColor(),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: getBorderColor(),
            width: isAnswered ? 2 : 1,
          ),
          boxShadow: [
            if (!isAnswered)
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isAnswered ? FontWeight.w600 : FontWeight.normal,
                color: isAnswered && !isSelected && !isCorrect
                    ? Colors.grey.shade600
                    : Colors.black87,
              ),
            ),
            if (isAnswered && getIcon() != null)
              Icon(
                getIcon(),
                color: getIconColor(),
                size: 24,
              ),
            if (isAnswered && getIcon() == null && isCorrect)
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}
