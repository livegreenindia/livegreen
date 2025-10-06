// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  int _happiness = 5;
  final Color primaryColor = const Color.fromARGB(255, 30, 149, 78);
  final Color backgroundLight = const Color(0xFFf6f8f7);
  final Color backgroundDark = const Color(0xFF122017);

  Widget activityCard(String title, String subtitle, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? backgroundDark
            : backgroundLight,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white.withOpacity(0.05)
              : Colors.black.withOpacity(0.05),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: primaryColor, size: 28),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    color: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.color!.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // 👇 Show congratulation popup
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Text(
                    "🎉 Activity Completed!",
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  content: Text(
                    "Great job! You’ve completed \"$title\". Keep up the good work!",
                    style: GoogleFonts.manrope(fontSize: 14),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(ctx),
                      child: Text("OK", style: TextStyle(color: primaryColor)),
                    ),
                  ],
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: Text(
              "Complete",
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? backgroundDark : backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                "Activities",
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // 🧠 Happiness Tracker Card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isDark ? backgroundDark : backgroundLight,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isDark
                              ? Colors.white.withOpacity(0.05)
                              : Colors.black.withOpacity(0.05),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "How are you feeling today?",
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "😊",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "$_happiness",
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Slider(
                            min: 1,
                            max: 10,
                            value: _happiness.toDouble(),
                            activeColor: primaryColor,
                            inactiveColor: Colors.grey.shade400,
                            onChanged: (value) {
                              setState(() {
                                _happiness = value.toInt();
                              });
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("1", style: TextStyle(fontSize: 12)),
                              Text("10", style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          const SizedBox(height: 12),

                          // ✅ Save Mood Button
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Happiness level ($_happiness) saved successfully!",
                                      style: GoogleFonts.manrope(),
                                    ),
                                    backgroundColor: primaryColor,
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              },
                              child: Text(
                                "Save Mood",
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // 🏃‍♀️ Activities List
                    activityCard(
                      "Birding",
                      "Connect with nature",
                      Icons.travel_explore,
                    ),
                    activityCard(
                      "Visiting Park",
                      "Enjoy the outdoors",
                      Icons.park,
                    ),
                    activityCard(
                      "Cold Water Shower",
                      "Refresh your body",
                      Icons.shower,
                    ),
                    activityCard(
                      "Gardening",
                      "Cultivate your garden",
                      Icons.grass,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
