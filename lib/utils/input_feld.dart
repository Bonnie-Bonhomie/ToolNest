
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.input,
    required this.onChanged,
    this.textType,
    this.hintText,
    this.textAlign,
  });

  final TextEditingController input;
  final Function(String?) onChanged;
  final TextInputType? textType;
  final String? hintText;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign ?? TextAlign.end,
      controller: input,
      keyboardType: textType ?? TextInputType.numberWithOptions(decimal: true),
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(2),
        hint: Text(hintText ?? '0.00', textAlign: textAlign ?? TextAlign.end),
      ),
    );
  }
}
