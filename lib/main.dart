import 'package:artec_solar_app/settings/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:artec_solar_app/settings/app_config.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      builder: (context, child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: child,
        );
      },
      // supportedLocales: [
      //   Locale('pt', 'BR'),
      // ],
    );
  }
}
