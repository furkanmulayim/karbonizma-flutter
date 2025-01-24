import 'package:flutter/material.dart';
import 'package:karbonizma/core/theme/app_colors.dart';
import 'package:karbonizma/core/constants/app_dimens.dart';

class SizedButton extends StatelessWidget {
  const SizedButton(
      {super.key, required this.onClick, required this.text, this.icon});

  final VoidCallback onClick;
  final String text;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(right: AppDimens.paddingMedium),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onClick,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accentGreen100,
              padding: const EdgeInsets.symmetric(
                vertical: AppDimens.paddingXSmall, // Daha ince padding
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimens.borderRadius),
              ),
              minimumSize: const Size(
                  AppDimens.zeroc, AppDimens.buttonHeight), // Minimum yükseklik
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  icon!,
                  const SizedBox(width: AppDimens.paddingSmall),
                ],
                Text(
                  text,
                  style: const TextStyle(
                    color: AppColors.textWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: AppDimens.fontxMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
