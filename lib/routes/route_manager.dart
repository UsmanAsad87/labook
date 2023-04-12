import 'package:flutter/material.dart';
import 'package:labook/features/login/views/login_screen.dart';
import 'package:labook/features/splash/splash_screen.dart';
import 'package:labook/utils/error_screen.dart';
import 'navigation.dart';

class AppRoutes {
//Common Portion
  static const String userSplashScreen = '/userSplashScreen';
  static const String loginScreen  = '/loginScreen ';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case userSplashScreen:
        return _buildRoute(SplashScreen());
      case loginScreen:
        return _buildRoute(const LoginScreen());






      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(builder: (_) => const ErrorScreen());
  }

  static _buildRoute(Widget widget, {int? duration = 400}) {
    return forwardRoute(widget, duration);
  }
  static _buildNormalRoute(Widget widget) {
    return MaterialPageRoute(builder: (_) => widget);
  }
}
