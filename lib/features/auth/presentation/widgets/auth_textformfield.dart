import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
    required this.textInputType,
  });
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      maxLength: 25,
      maxLines: 1,
      decoration: InputDecoration(
        border: InputBorder.none,
        counterText: '',
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 14,
          letterSpacing: 2.0,
        ),
      ),
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return '$hintText can not be empty!';
        }
        return null;
      },
    );
  }
}
