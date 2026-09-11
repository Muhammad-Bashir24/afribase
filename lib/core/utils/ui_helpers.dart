import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class UIHelpers {
  static void showCustomToast(
    BuildContext context, {
    required String message,
    bool isError = false,
  }) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isError ? Colors.redAccent.shade700 : Colors.green.shade700,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              isError ? Icons.error_outline : Icons.check_circle_outline,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ).animate().fade().slideY(begin: 0.5, end: 0),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

class CustomLoadingIndicator extends StatelessWidget {
  final Color color;
  
  const CustomLoadingIndicator({
    super.key,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.2),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.sync,
          color: color,
        ).animate(onPlay: (controller) => controller.repeat())
         .rotate(duration: 1.seconds),
      ),
    );
  }
}
