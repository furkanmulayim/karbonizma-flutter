import 'package:flutter/material.dart';
import 'package:karbonizma/core/theme/app_colors.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BackAppBar({super.key, required this.text, required this.backClick});

  final String text;
  final VoidCallback backClick;

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
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.accentGreen900,
        ),
        onPressed: () {
          backClick();
        },
      ),
    );
  }
}
