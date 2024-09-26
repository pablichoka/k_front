// lib/widgets/common/custom_text_field.dart
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final bool? obscureTextToggle;
  final Function(String?) onSave;
  final String? Function(String?)? validator;
  final VoidCallback? toggleObscureText;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.obscureTextToggle,
    required this.onSave,
    this.validator,
    this.toggleObscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(      
        validator: validator ?? (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter required information.';
          }
          return null;
        },
        obscureText: obscureText && (obscureTextToggle ?? false),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onSaved: onSave,
        decoration: InputDecoration(
          labelText: hintText,
          prefixIcon: Icon(icon),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorStyle: const TextStyle(
            fontSize: 10,
            height: 1,
          ),
          suffixIcon: obscureText
              ? IconButton(
                  icon: Icon(
                    (obscureTextToggle ?? false) ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: toggleObscureText,
                )
              : null,
        ),
      ),
    );
  }
}