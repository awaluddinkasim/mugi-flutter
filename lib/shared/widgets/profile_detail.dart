import 'package:flutter/material.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({
    super.key,
    required this.label,
    required this.data,
  });

  final String label;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          data,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
