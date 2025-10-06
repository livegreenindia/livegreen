import 'package:flutter/material.dart';
import '../screens/auth/login.dart';
import '../screens/auth/forgot_password.dart';
import '../screens/pages/home.dart';
import '../screens/auth/signup.dart';
import '../screens/pages/progress.dart';
import '../screens/pages/community.dart';
import '../screens/pages/profile.dart';
import '../screens/pages/activity.dart';

class AppRoutes {
  static const login = '/login';
  static const home = '/home';
  static const signup = '/signup';
  static const forgetPassword = '/forgot-password';
  static const progress = '/progress';
  static const community = '/community';
  static const profile = '/profile';
  static const activity = '/activity';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case activity:
        return MaterialPageRoute(builder: (_) => const ActivityPage());
      case progress:
        return MaterialPageRoute(builder: (_) => const ProgressPage());
      case community:
        return MaterialPageRoute(builder: (_) => const CommunityPage());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
