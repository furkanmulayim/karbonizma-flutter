import 'package:flutter/material.dart';
import 'package:karbonizma/core/constants/app_colors.dart';

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
            color: AppColors.accentBlue900,
          )),
      backgroundColor: AppColors.accentBlue200,
      centerTitle: true,
    );
  }
}
