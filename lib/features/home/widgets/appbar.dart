import 'package:employee_app/core/constants.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.splashBackground,
      leading: null,
      automaticallyImplyLeading: false,
      elevation: 50,
      title: simpleText(
        "Employee App",
        fontWeight: FontWeight.w500,
        color: AppColors.primary,
      ),
      centerTitle: true,
    );
  }
}
