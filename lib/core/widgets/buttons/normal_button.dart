import 'package:flutter/material.dart';
import 'package:karbonizma/core/constants/app_colors.dart';
import 'package:karbonizma/core/constants/app_dimens.dart';

class NormalButton extends StatelessWidget {
  final VoidCallback onclick;
  final String text;

  const NormalButton({super.key, required this.onclick, required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingSmall),
      child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppDimens.paddingMedium),

        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              onclick;
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accentBlue100,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppDimens.borderRadius),
                  topRight: Radius.circular(AppDimens.borderRadius),
                  bottomLeft: Radius.circular(AppDimens.borderRadius),
                  bottomRight: Radius.circular(AppDimens.borderRadius),
                ),
              ),
            ),
            child: Text(
              text,
              style: const TextStyle(
                color: AppColors.textWhite,
                fontWeight: FontWeight.bold,
                fontSize: AppDimens.fontMedium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
