import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';

class WritingToolbar extends StatelessWidget {
  final VoidCallback onClear;
  final VoidCallback onUndo;
  final VoidCallback onHint;
  final VoidCallback onCheck;

  const WritingToolbar({
    super.key,
    required this.onClear,
    required this.onUndo,
    required this.onHint,
    required this.onCheck,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ToolbarButton(
            icon: Icons.delete_outline_rounded,
            label: "Clear",
            onTap: onClear,
          ),
        ),

        const SizedBox(width: AppSpacing.sm),

        Expanded(
          child: _ToolbarButton(
            icon: Icons.undo_rounded,
            label: "Undo",
            onTap: onUndo,
          ),
        ),

        const SizedBox(width: AppSpacing.sm),

        Expanded(
          child: _ToolbarButton(
            icon: Icons.lightbulb_outline_rounded,
            label: "Hint",
            onTap: onHint,
          ),
        ),

        const SizedBox(width: AppSpacing.sm),

        Expanded(
          child: _ToolbarButton(
            icon: Icons.check_circle_outline_rounded,
            label: "Check",
            onTap: onCheck,
          ),
        ),
      ],
    );
  }
}

class _ToolbarButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ToolbarButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 20),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.card,
          foregroundColor: AppColors.primary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}