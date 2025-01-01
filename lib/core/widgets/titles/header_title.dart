// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:karbonizma/core/constants/app_colors.dart';
import 'package:karbonizma/core/constants/app_dimens.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(Object context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppDimens.paddingMedium),
        child: Padding(
          padding: const EdgeInsets.only(top: AppDimens.paddingSmall),
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: AppDimens.fontLarge,
              fontWeight: FontWeight.w500,
              color: AppColors.dividerColor,
            ),
          ),
        ),
      ),
    );
  }
}
