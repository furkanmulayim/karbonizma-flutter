import 'package:flutter/material.dart';
import 'package:karbonizma/core/constants/app_dimens.dart';

class WidthBox extends StatelessWidget {
  const WidthBox({super.key});

  @override
  Widget build(Object context) {
    return const SizedBox(
      width: AppDimens.paddingSmall,
    );
  }
}
