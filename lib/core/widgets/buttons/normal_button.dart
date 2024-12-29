import 'package:flutter/material.dart';
import 'package:karbonizma/core/constants/app_colors.dart';
import 'package:karbonizma/core/constants/app_dimens.dart';

class NormalButton extends StatelessWidget {
  const NormalButton(
      {Key? key, required this.onClick, required this.text, this.icon})
      : super(key: key);

  final VoidCallback onClick;
  final String text;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.paddingLarge),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppDimens.paddingMedium),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onClick,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accentBlue100,
              padding: const EdgeInsets.symmetric(
                vertical: AppDimens.paddingXMedium,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimens.borderRadius),
              ),
            ),
            child:  Row(
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
      ),
    );
  }
}
