import 'package:flutter/material.dart';
import 'package:karbonizma/core/constants/app_dimens.dart';

class HeightBox extends StatelessWidget {
  const HeightBox({super.key, this.h});

  final double? h;

  @override
  Widget build(Object context) {
    return SizedBox(
      height: h ?? AppDimens.paddingSmall,
    );
  }
}
