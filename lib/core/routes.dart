import 'package:employee_app/features/home/presentation/home_bottombar.dart';
import 'package:employee_app/features/home/presentation/home_screen.dart';
import 'package:employee_app/features/login/login_screen.dart';
import 'package:flutter/cupertino.dart';

/// All of the screens in the app will be added here for reference
class Screens {
 
  static const homeBottomBar = "homeBottomBar";
  static const homeScreen = "homeScreen";
  static const login = "login";
 
}

class Routes {
  /// Global NavigatorKey to be used inside the MaterialApp
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Implementation of the onGenerateRoute function inside the MaterialApp
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
   

      case Screens.homeScreen:
        return CupertinoPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case Screens.login:
        return CupertinoPageRoute(builder: (context) => const LoginScreen());

      case Screens.homeBottomBar:
        return CupertinoPageRoute(
          builder: (context) => const HomeBottomBarScreen(),
        );

     
      default:
        return null;
    }
  }

  /// Returns the current BuildContext at any point in the app
  static BuildContext get currentContext => navigatorKey.currentContext!;

  /// Implementation of Navigator.pushNamed() function
  static void goTo(String route, {Object? arguments}) {
    Navigator.pushNamed(currentContext, route, arguments: arguments);
  }

  /// Implementation of Navigator.pushReplacementNamed() function
  static void goToReplacement(String route, {Object? arguments}) {
    Navigator.pushReplacementNamed(currentContext, route, arguments: arguments);
  }

  /// Implementation of Navigator.pushReplacementNamed() function
  static void closeAllAndGoTo(String route, {Object? arguments}) {
    Navigator.popUntil(currentContext, (route) => route.isFirst);
    Navigator.pushReplacementNamed(currentContext, route, arguments: arguments);
  }

  /// Implementation of Navigator.pop() function
  static void goBack() {
    Navigator.pop(currentContext);
  }
}
