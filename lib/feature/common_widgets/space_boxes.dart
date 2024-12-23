import 'package:flutter/material.dart';
import 'package:karbonizma/product/util/constant/app_dimens.dart';
///sized box
class  HeightBox extends StatelessWidget {
  @override
  Widget build(Object context) {
    return const SizedBox(
      height:  AppDimens.paddingSmall,
    );
  }
}

class  WidthBox extends StatelessWidget {
  @override
  Widget build(Object context) {
    return const SizedBox(
      width:  AppDimens.paddingSmall,
    );
  }
}
