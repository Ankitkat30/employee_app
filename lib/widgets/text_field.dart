

import 'package:employee_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleTextField extends StatelessWidget {
  final String? initialValue;
  final bool? enabled;
  final bool? obscureText;
  final String? hintText;
  final bool isNumberField;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  const SimpleTextField({
    Key? key,
    this.initialValue,
    this.validator,
    this.controller,
    this.obscureText,
    this.onChanged,
    this.hintText,
    required this.isNumberField,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      inputFormatters:
          isNumberField ? [FilteringTextInputFormatter.digitsOnly] : null,
      onChanged: onChanged,
      style: GoogleFonts.hind(
        fontWeight: FontWeight.w500,
        color: AppColors.text,
      ),
      keyboardType: isNumberField ? TextInputType.phone : null,
      controller: controller,
      obscureText: obscureText ?? false,
      validator: validator,
      initialValue: initialValue,
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 13.0, horizontal: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: AppColors.greyLight,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: AppColors.greyLight,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: AppColors.greyLight,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
