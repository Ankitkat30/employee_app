import 'package:employee_app/core/constants.dart';
import 'package:employee_app/core/routes.dart';
import 'package:employee_app/features/home/logic/home_cubit.dart';
import 'package:employee_app/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          theme: Themes.defaultTheme,
          debugShowCheckedModeBanner: false,
          navigatorKey: Routes.navigatorKey,
          onGenerateRoute: Routes.onGenerateRoute,
          initialRoute: Screens.login,
        ),
        designSize: const Size(430, 932),
      ),
    );
  }
}
