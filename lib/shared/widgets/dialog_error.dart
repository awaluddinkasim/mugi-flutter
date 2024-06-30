import 'package:flutter/material.dart';

class DialogError extends StatelessWidget {
  const DialogError({
    super.key,
    required this.message,
    required this.onPressed,
  });

  final String message;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 16,
            ),
            const Icon(
              Icons.error_outline_rounded,
              color: Colors.red,
              size: 108,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Gagal",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Text(message),
            const SizedBox(
              height: 16,
            ),
            FilledButton(
              onPressed: onPressed,
              style: const ButtonStyle(
                padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(horizontal: 48),
                ),
              ),
              child: const Text("OK"),
            ),
          ],
        ),
      ),
    );
  }
}
