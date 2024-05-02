import 'package:employee_app/core/constants.dart';
import 'package:employee_app/core/routes.dart';
import 'package:employee_app/features/login/logic/cubit/login_cubit.dart';
import 'package:employee_app/utils/dialogs.dart';
import 'package:employee_app/widgets/all_buttons.dart';
import 'package:employee_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LoginCubit>(context, listen: true);
    return BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoadedState) {
            Routes.closeAllAndGoTo(Screens.homeBottomBar);
          }
          if (state is LoginErrorState) {
            showSnackBar(state.error);
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                  horizontal: 20.w,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height(30),
                      heading1Text(
                        "Employee Detail App",
                        color: AppColors.primary,
                      ),
                      height(100),
                      heading1Text(
                        "Login To Account",
                        color: AppColors.primary,
                      ),
                      height(30),
                      simpleText(
                        "Mobile Number",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      height(8),
                      SimpleTextField(
                        isNumberField: true,
                        hintText: "Enter Mobile Number",
                        controller: mobileController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Mobile Number is required!";
                          }

                          return null;
                        },
                      ),
                      height(20),
                      simpleText(
                        "Password",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      height(8),
                      SimpleTextField(
                        isNumberField: false,
                        hintText: "Enter Password",
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Password is required!";
                          }

                          return null;
                        },
                      ),
                      height(80),
                      SimpleButton(
                        onPressed: () async {
                          if (!formKey.currentState!.validate()) return;
                          await cubit.login(
                              mobile: mobileController.text.trim(),
                              password: passwordController.text.trim());
                        },
                        color: AppColors.primary,
                        isLoading: cubit.state is LoginLoadingState,
                        text: "Login",
                        verticalPadding: 8,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.white,
                      ),
                      height(40),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
