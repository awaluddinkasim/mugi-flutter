import 'package:flutter/material.dart';

class Select extends StatelessWidget {
  const Select({
    super.key,
    required this.label,
    required this.hintText,
    required this.icon,
    required this.items,
    required this.onChanged,
    required this.value,
    this.validator,
  });

  final String value;
  final String label;
  final String hintText;
  final Icon icon;
  final List<DropdownMenuItem> items;
  final Function(dynamic) onChanged;
  final String Function(dynamic)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButtonFormField(
          value: value,
          items: items,
          hint: Text(hintText),
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.lightBlue.shade50.withOpacity(0.2),
            prefixIcon: const Icon(Icons.transgender),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.lightBlue,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.lightBlue,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.lightBlue.shade100.withOpacity(0.5),
                width: 1,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
