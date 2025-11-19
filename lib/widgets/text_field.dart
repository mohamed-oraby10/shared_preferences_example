import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.onSaved, required this.hintText});
  final void Function(String?)? onSaved;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
      ),
      validator: (value) {
        if (value == null) {
          return 'Field is required';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
