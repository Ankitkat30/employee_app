import 'package:employee_app/core/constants.dart';
import 'package:employee_app/widgets/all_buttons.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SimpleButton(
              color: AppColors.primary,
              isLoading: false,
              text: "Sign Out",
              verticalPadding: 14,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              onPressed: () async {},
              textColor: AppColors.white,
            ),
          ),
        ],
      ),
    )));
  }
}
