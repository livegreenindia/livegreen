import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/welcome.dart';
import '../screens/auth/login.dart';

class SplashWrapper extends StatefulWidget {
  const SplashWrapper({super.key});

  @override
  State<SplashWrapper> createState() => _SplashWrapperState();
}

class _SplashWrapperState extends State<SplashWrapper> {
  bool? _seenOnboarding;

  @override
  void initState() {
    super.initState();
    _checkFirstSeen();
  }

  Future<void> _checkFirstSeen() async {
    final prefs = await SharedPreferences.getInstance();
    final seen = prefs.getBool("seenOnboarding") ?? false;
    setState(() => _seenOnboarding = seen);
  }

  @override
  Widget build(BuildContext context) {
    if (_seenOnboarding == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return _seenOnboarding! ? const LoginScreen() : const WelcomePage();
  }
}
