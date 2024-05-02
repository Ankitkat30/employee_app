import 'package:employee_app/core/routes.dart';
import 'package:flutter/material.dart';

void showSnackBar(String content,
    {Color backgroundColor = Colors.red,
    Duration duration = const Duration(seconds: 3),
    SnackBarBehavior behavior = SnackBarBehavior.floating}) {
  SnackBar snackBar = SnackBar(
      behavior: behavior,
      content: Text(content),
      backgroundColor: backgroundColor,
      duration: duration);
  ScaffoldMessenger.of(Routes.currentContext).showSnackBar(
    snackBar,
  );
}

void showGreenSnackBar(String content,
    {Color backgroundColor = Colors.green,
    Duration duration = const Duration(seconds: 3),
    SnackBarBehavior behavior = SnackBarBehavior.floating}) {
  SnackBar snackBar = SnackBar(
      content: Text(content),
      behavior: behavior,
      backgroundColor: backgroundColor,
      duration: duration);
  ScaffoldMessenger.of(Routes.currentContext).showSnackBar(snackBar);
}
