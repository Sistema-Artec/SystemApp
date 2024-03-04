import 'package:flutter/material.dart';
import 'package:artec_solar_app/settings/app_config.dart';
import 'package:artec_solar_app/src/authentication/authentication.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.authenticationScreen:
        return buildRoute(const AuthenticationScreen(), settings: settings);
      case AppRoutes.loginScreen:
        return buildRoute(const LoginScreen(), settings: settings);
      default:
        return _errorRoute();
    }
  }

  static MaterialPageRoute buildRoute(
    Widget child, {
    required RouteSettings settings,
  }) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => child,
    );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text(
              'ERROR!!',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.black,
                    height: 450.0,
                    width: 450.0,
                  ),
                  const Text(
                    'Seems the route you\'ve navigated to doesn\'t exist!!',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
