import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../models/progress_model.dart';

class ActivityCalendar extends StatelessWidget {
  final ProgressModel progress;

  const ActivityCalendar({
    super.key,
    required this.progress,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.calendar_month_rounded,
                color: Colors.teal,
              ),
              SizedBox(width: 10),
              Text(
                "Study Activity",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: progress.activity.map((active) {
              return Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: active
                      ? Colors.green
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 20),

          const Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Text("Less"),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Divider(),
                ),
              ),
              Text("More"),
            ],
          ),
        ],
      ),
    );
  }
}