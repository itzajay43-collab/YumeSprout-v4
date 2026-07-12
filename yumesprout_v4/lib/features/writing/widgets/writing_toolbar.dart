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
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _ToolbarButton(
              icon: Icons.delete_outline_rounded,
              label: "Clear",
              color: Colors.red,
              onTap: onClear,
            ),
          ),

          const SizedBox(width: AppSpacing.sm),

          Expanded(
            child: _ToolbarButton(
              icon: Icons.undo_rounded,
              label: "Undo",
              color: Colors.orange,
              onTap: onUndo,
            ),
          ),

          const SizedBox(width: AppSpacing.sm),

          Expanded(
            child: _ToolbarButton(
              icon: Icons.lightbulb_outline_rounded,
              label: "Hint",
              color: Colors.amber,
              onTap: onHint,
            ),
          ),

          const SizedBox(width: AppSpacing.sm),

          Expanded(
            child: _ToolbarButton(
              icon: Icons.check_circle_outline_rounded,
              label: "Check",
              color: AppColors.primary,
              onTap: onCheck,
            ),
          ),
        ],
      ),
    );
  }
}

class _ToolbarButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ToolbarButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.08),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 28,
                color: color,
              ),

              const SizedBox(height: 8),

              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}