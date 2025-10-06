// ignore_for_file: deprecated_member_use

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/routes.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Scrollable Banner Image
              Image.network(
                "https://lh3.googleusercontent.com/aida-public/AB6AXuD9qjk1riHArzwwlTWYeNyZYpp_ovT1UZYW3PvHK4YYangVlRLzRmKTFsefac1OfHiR5ArbZjS41EtXsCyXVj1fx_-kFWlJP2KmNJPGh2WqI5XI6nokwNqF167nxu4VihNE-lzc0CxOlSFS1J0vRIce57iaCpfQUXgBkylxveRdy16d1T5GYYUdi-3Z8x7Sy38BZeZaoQ1tIyzB-a0EXq52J5WJ0XnMaH1vk2RE1XhoaHRnxZI51KQInsAU3x2qle9frs_03mTxjC0",
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),

              // Body
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Title & subtitle
                    Text(
                      "Create an Account",
                      style: GoogleFonts.manrope(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Join LiveGreen to start your journey.",
                      style: GoogleFonts.manrope(
                        fontSize: 16,
                        color: theme.colorScheme.onSurface.withOpacity(0.7),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),

                    // Name
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Name",
                        filled: true,
                        fillColor: isDark
                            ? Colors.grey.shade800
                            : Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Email
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Email",
                        filled: true,
                        fillColor: isDark
                            ? Colors.grey.shade800
                            : Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Password
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        filled: true,
                        fillColor: isDark
                            ? Colors.grey.shade800
                            : Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Confirm Password
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        filled: true,
                        fillColor: isDark
                            ? Colors.grey.shade800
                            : Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Sign Up button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF019863),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.home,
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // OR divider
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: isDark
                                ? Colors.grey.shade700
                                : Colors.grey.shade300,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "OR",
                            style: GoogleFonts.manrope(
                              fontSize: 14,
                              color: isDark
                                  ? Colors.grey.shade400
                                  : Colors.grey.shade600,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: isDark
                                ? Colors.grey.shade700
                                : Colors.grey.shade300,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Gmail button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: isDark
                              ? Colors.grey.shade800
                              : Colors.white,
                          side: BorderSide(
                            color: isDark
                                ? Colors.grey.shade700
                                : Colors.grey.shade300,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: const Icon(Icons.mail, color: Colors.red),
                        onPressed: () {},
                        label: Text(
                          "Sign up with Gmail",
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Facebook button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1877F2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: const Icon(Icons.facebook, color: Colors.white),
                        onPressed: () {},
                        label: Text(
                          "Sign up with Facebook",
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Already have account? Login
                    Text.rich(
                      TextSpan(
                        text: "Already have an account? ",
                        style: GoogleFonts.manrope(
                          fontSize: 14,
                          color: isDark
                              ? Colors.grey.shade400
                              : Colors.grey.shade600,
                        ),
                        children: [
                          TextSpan(
                            text: "Log in",
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF019863),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, AppRoutes.login);
                              },
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
