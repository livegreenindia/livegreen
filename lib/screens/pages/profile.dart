// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final Color primaryColor = const Color(0xFF38e07b);
  final Color backgroundLight = const Color(0xFFf6f8f7);
  final Color backgroundDark = const Color(0xFF122017);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? backgroundDark : backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                "My Profile",
                style: GoogleFonts.manrope(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),

              const SizedBox(height: 20),

              // Profile Info Card
              _profileInfoCard(context),

              const SizedBox(height: 20),

              // Subscription Plan Placeholder
              _planCard(context),
            ],
          ),
        ),
      ),
    );
  }

  // --- Profile Info Card ---
  Widget _profileInfoCard(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark
            ? backgroundDark.withOpacity(0.6)
            : backgroundLight.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark
              ? Colors.white.withOpacity(0.05)
              : Colors.black.withOpacity(0.05),
        ),
      ),
      child: Column(
        children: [
          _infoRow(context, label: "Name", value: "Jane Doe"),
          const Divider(height: 1),
          _infoRow(context, label: "Email", value: "janedoe@email.com"),
          const Divider(height: 1),
          _infoRow(context, label: "Watch Integration", value: "Connected"),
        ],
      ),
    );
  }

  Widget _infoRow(
    BuildContext context, {
    required String label,
    required String value,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.manrope(
              fontSize: 14,
              color: isDark ? Colors.white60 : Colors.black54,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.manrope(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // --- Plan Card (Coming Soon) ---
  Widget _planCard(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark
            ? backgroundDark.withOpacity(0.6)
            : backgroundLight.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark
              ? Colors.white.withOpacity(0.05)
              : Colors.black.withOpacity(0.05),
        ),
      ),
      child: Center(
        child: Text(
          "Subscription Plans – Coming Soon",
          style: GoogleFonts.manrope(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white70 : Colors.black87,
          ),
        ),
      ),
    );
  }
}
