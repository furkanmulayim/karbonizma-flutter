// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:karbonizma/product/util/constant/app_colors.dart';
import 'package:karbonizma/product/util/constant/app_dimens.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingLarge),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppDimens.marginMedium),
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: AppDimens.fontLarge,
              color: AppColors.textWhite,
            ),
          ),
        ),
      ),
    );
  }
}
