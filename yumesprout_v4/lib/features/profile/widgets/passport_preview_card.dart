import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../models/profile_model.dart';

class PassportPreviewCard extends StatelessWidget {
  final ProfileModel profile;

  const PassportPreviewCard({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFFF7FBFF),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.book_rounded,
                color: Colors.indigo,
              ),
              SizedBox(width: 10),
              Text(
                "Dream Passport",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          _city("🗼", "Tokyo", true),
          const SizedBox(height: 10),

          _city("⛩", "Kyoto", true),
          const SizedBox(height: 10),

          _city("🍜", "Osaka", false),
          const SizedBox(height: 10),

          _city("🦌", "Nara", false),
          const SizedBox(height: 20),

          LinearProgressIndicator(
            value: profile.passportCities / 7,
            minHeight: 8,
            borderRadius: BorderRadius.circular(20),
          ),

          const SizedBox(height: 12),

          Center(
            child: Text(
              "${profile.passportCities} / 7 Cities Explored",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Dream Passport coming soon 🛂",
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.flight_takeoff_rounded),
              label: const Text("Open Passport"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _city(
    String emoji,
    String city,
    bool unlocked,
  ) {
    return Row(
      children: [
        Text(
          emoji,
          style: const TextStyle(fontSize: 22),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Text(
            city,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        Icon(
          unlocked
              ? Icons.check_circle
              : Icons.lock_outline,
          color: unlocked
              ? Colors.green
              : Colors.grey,
        ),
      ],
    );
  }
}