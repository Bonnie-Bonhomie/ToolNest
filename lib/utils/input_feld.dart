
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.input,
    required this.onChanged
  });

  final TextEditingController input;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.end,
      controller: input,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(2),
        hint: Text('0.00', textAlign: TextAlign.end),
      ),
    );
  }
}
