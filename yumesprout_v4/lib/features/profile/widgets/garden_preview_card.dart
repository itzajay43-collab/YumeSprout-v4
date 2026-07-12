import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../models/profile_model.dart';

class GardenPreviewCard extends StatelessWidget {
  final ProfileModel profile;

  const GardenPreviewCard({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFFF4F8),
            Color(0xFFFFFBFD),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(.10),
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
                Icons.local_florist_rounded,
                color: Colors.pink,
              ),
              SizedBox(width: 10),
              Text(
                "Sakura Garden",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          Center(
            child: Text(
              "🌱 🌸 🌸 🌸 🌳",
              style: const TextStyle(
                fontSize: 42,
              ),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            "Garden Level ${profile.gardenLevel}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "Keep learning every day to grow your own peaceful Japanese garden.",
            style: TextStyle(
              color: Colors.grey,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 22),

          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.park_rounded,
                  color: Colors.green,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Next Unlock: ⛩ Torii Gate",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Full Sakura Garden is coming soon 🌸",
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text("Visit Garden"),
            ),
          ),
        ],
      ),
    );
  }
}