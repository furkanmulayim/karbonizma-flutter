import 'package:flutter/material.dart';
import 'package:karbonizma/core/constants/app_dimens.dart';

class HeightBox extends StatelessWidget {
  const HeightBox({super.key});

  @override
  Widget build(Object context) {
    return const SizedBox(
      height: AppDimens.paddingSmall,
    );
  }
}
