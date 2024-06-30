import 'package:flutter/material.dart';

class DialogSuccess extends StatelessWidget {
  const DialogSuccess({
    super.key,
    required this.onPressed,
  });

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
              Icons.check_circle_outline_rounded,
              color: Colors.green,
              size: 108,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Berhasil",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
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
