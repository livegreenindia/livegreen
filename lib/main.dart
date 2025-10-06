import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'config/routes.dart';
import 'screens/splash_wrapper.dart';

void main() {
  runApp(const LiveGreenApp());
}

class LiveGreenApp extends StatelessWidget {
  const LiveGreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LiveGreen',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      onGenerateRoute: AppRoutes.generateRoute,
      home: const SplashWrapper(), // <-- starting point
    );
  }
}
