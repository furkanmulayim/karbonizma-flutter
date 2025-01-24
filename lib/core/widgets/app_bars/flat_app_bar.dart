import 'package:flutter/material.dart';
import 'package:karbonizma/core/theme/app_colors.dart';

class FlatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FlatAppBar({super.key, required this.text});

  final String text;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text,
          style: TextStyle(
            color: AppColors.accentGreen900,
          )),
      backgroundColor: AppColors.accentGreen200,
      centerTitle: true,
    );
  }
}
