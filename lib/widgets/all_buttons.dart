import 'package:employee_app/core/constants.dart';
import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  final String text;
  final Color color;
  final double verticalPadding;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? textColor;
  final bool isLoading;
  final VoidCallback? onPressed;
  const SimpleButton({
    super.key,
    required this.text,
    required this.color,
    required this.verticalPadding,
    this.fontSize,
    this.textColor,
    required this.isLoading,
    this.fontWeight,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: isLoading
            ? SizedBox(
                width: 28,
                height: 28,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(AppColors.white),
                  strokeWidth: 2,
                ),
              )
            : simpleText(
                text,
                color: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
      ),
    );
  }
}
