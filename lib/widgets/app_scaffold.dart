import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final String? title;
  final List<Widget>? actions;
  final bool showAppBar;

  const AppScaffold({
    super.key,
    required this.child,
    this.title,
    this.actions,
    this.showAppBar = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: showAppBar
          ? AppBar(
              title: Text(title ?? ""),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: actions,
            )
          : null,

      body: SafeArea(
        child: child,
      ),
    );
  }
}