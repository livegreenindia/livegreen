// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  final Color primaryColor = const Color.fromARGB(255, 30, 149, 78);
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
                "Community",
                style: GoogleFonts.manrope(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),

              const SizedBox(height: 20),

              // Section: Post box
              _postBox(context),

              const SizedBox(height: 20),

              // Section: Trending Posts
              Text(
                "Trending Discussions",
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),

              const SizedBox(height: 10),

              _postCard(
                context,
                user: "Ethan Carter",
                time: "2d",
                content:
                    "Just completed a 10k run! Feeling great and energized. Anyone else crushing their fitness goals today?",
                likes: "1.2k",
                comments: "89",
              ),

              const SizedBox(height: 20),

              _postCard(
                context,
                user: "Sophia Bennett",
                time: "1d",
                content:
                    "Mindfulness meditation session this morning was so calming. Highly recommend it to start your day!",
                likes: "876",
                comments: "42",
              ),

              const SizedBox(height: 20),

              _postCard(
                context,
                user: "Liam Harper",
                time: "3d",
                content: "Trying out a new healthy recipe today. Wish me luck!",
                likes: "451",
                comments: "12",
                imageUrl:
                    "https://images.unsplash.com/photo-1504674900247-0877df9cc836",
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Post Box ---
  Widget _postBox(BuildContext context) {
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
          TextField(
            maxLines: 2,
            style: GoogleFonts.manrope(
              fontSize: 14,
              color: isDark ? Colors.white : Colors.black,
            ),
            decoration: InputDecoration(
              hintText: "Share your thoughts...",
              hintStyle: GoogleFonts.manrope(
                color: isDark ? Colors.white54 : Colors.black54,
              ),
              border: InputBorder.none,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.image_outlined,
                color: isDark ? Colors.white70 : Colors.black54,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Post",
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- Post Card ---
  Widget _postCard(
    BuildContext context, {
    required String user,
    required String time,
    required String content,
    required String likes,
    required String comments,
    String? imageUrl,
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
          // User + Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                user,
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
              Text(
                time,
                style: GoogleFonts.manrope(
                  fontSize: 12,
                  color: isDark ? Colors.white60 : Colors.black54,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Post Content
          Text(
            content,
            style: GoogleFonts.manrope(
              fontSize: 14,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),

          if (imageUrl != null) ...[
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),
          ],

          const SizedBox(height: 12),

          // Likes + Comments
          Row(
            children: [
              Icon(
                Icons.favorite_border,
                size: 18,
                color: isDark ? Colors.white54 : Colors.black54,
              ),
              const SizedBox(width: 4),
              Text(
                likes,
                style: GoogleFonts.manrope(
                  fontSize: 12,
                  color: isDark ? Colors.white60 : Colors.black54,
                ),
              ),
              const SizedBox(width: 16),
              Icon(
                Icons.chat_bubble_outline,
                size: 18,
                color: isDark ? Colors.white54 : Colors.black54,
              ),
              const SizedBox(width: 4),
              Text(
                comments,
                style: GoogleFonts.manrope(
                  fontSize: 12,
                  color: isDark ? Colors.white60 : Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
