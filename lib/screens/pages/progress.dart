import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

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
                "Overview",
                style: GoogleFonts.manrope(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),

              const SizedBox(height: 20),

              // Section: Happiness & Activities
              Text(
                "Daily Happiness & Activity Completion",
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),

              const SizedBox(height: 10),

              DropdownButtonFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: isDark
                      ? backgroundLight.withOpacity(0.05)
                      : backgroundDark.withOpacity(0.05),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                initialValue: "weekly",
                items: const [
                  DropdownMenuItem(value: "weekly", child: Text("This Week")),
                  DropdownMenuItem(value: "monthly", child: Text("This Month")),
                  DropdownMenuItem(value: "yearly", child: Text("This Year")),
                ],
                onChanged: (value) {},
              ),

              const SizedBox(height: 20),

              _chartCard(
                context,
                title: "Happiness & Activity Completion",
                stats: "7.5 / 85%",
                sub: "Last 7 Days",
                change: "+5%",
                chartPlaceholder: "📊 Chart Here",
              ),

              const SizedBox(height: 30),

              // Section: Smartwatch
              _chartCard(
                context,
                title: "Smartwatch Data",
                stats: "10.2k steps",
                sub: "Avg Heart Rate: 72 bpm",
                change: "",
                chartPlaceholder: "⌚ Chart Here",
              ),

              const SizedBox(height: 30),

              // Section: Screen Time
              _chartCard(
                context,
                title: "Screen Time",
                stats: "4h 32m / 3h limit",
                sub: "Daily Average",
                change: "+12% from last week",
                changeColor: Colors.redAccent,
                warning: true,
                chartPlaceholder: "📱 Chart Here",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chartCard(
    BuildContext context, {
    required String title,
    required String stats,
    required String sub,
    required String change,
    required String chartPlaceholder,
    Color? changeColor,
    bool warning = false,
  }) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title + optional warning
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Stats
          Text(
            stats,
            style: GoogleFonts.manrope(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            sub,
            style: GoogleFonts.manrope(
              fontSize: 12,
              color: isDark ? Colors.white60 : Colors.black54,
            ),
          ),

          if (change.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(
              change,
              style: GoogleFonts.manrope(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: changeColor ?? Colors.green,
              ),
            ),
          ],

          const SizedBox(height: 16),

          // Chart placeholder
          Container(
            height: 180,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.white.withOpacity(0.05)
                  : Colors.black.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              chartPlaceholder,
              style: GoogleFonts.manrope(
                color: isDark ? Colors.white54 : Colors.black54,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
