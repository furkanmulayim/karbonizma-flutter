import 'package:flutter/material.dart';
import 'package:karbonizma/core/constants/app_colors.dart';

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
            color: AppColors.accentBlue900,
          )),
      backgroundColor: AppColors.accentBlue200,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.accentBlue900,
        ),
        onPressed: () {
          backClick();
        },
      ),
    );
  }
}
