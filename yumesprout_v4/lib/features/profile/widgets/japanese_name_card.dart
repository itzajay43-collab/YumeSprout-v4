import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../models/profile_model.dart';

class JapaneseNameCard extends StatelessWidget {
  final ProfileModel profile;

  const JapaneseNameCard({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Icon(
                Icons.badge_rounded,
                color: Colors.red,
              ),
              SizedBox(width: 10),
              Text(
                "Japanese Identity",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          Text(
            profile.japaneseName,
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            profile.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Pronunciation feature coming soon 🔊",
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.volume_up_rounded),
                  label: const Text("Listen"),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: FilledButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Change Japanese name coming soon ✨",
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit_rounded),
                  label: const Text("Edit"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}