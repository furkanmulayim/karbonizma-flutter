import 'package:flutter/material.dart';
import 'package:karbonizma/core/constants/app_dimens.dart';

class WidthBox extends StatelessWidget {
  const WidthBox({super.key, this.w});

  final double? w;

  @override
  Widget build(Object context) {
    return SizedBox(
      width: w ?? AppDimens.paddingSmall,
    );
  }
}
