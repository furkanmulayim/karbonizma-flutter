import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:karbonizma/feature/common_widgets/space_boxes.dart';
import 'package:karbonizma/product/repository/remoot/recycle_repository.dart';
import 'package:karbonizma/product/util/constant/app_colors.dart';
import 'package:karbonizma/product/util/constant/app_dimens.dart';
import 'package:lottie/lottie.dart';

part 'greeting_widgets.dart';

///
class GreetingView extends StatelessWidget {
  // ignore: public_member_api_docs
  const GreetingView({required this.id, required this.waste, super.key});

  /// waste weight for kilo type
  final int id;

  final int waste;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _GreetingBody(id: id, waste: waste),
    );
  }
}

class _GreetingBody extends StatelessWidget {
  const _GreetingBody({required this.id, required this.waste});

  final int id;
  final int waste;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Lottie(),
          HeightBox(),
          _CongratsHeader(),
          HeightBox(),
          _CongratsText(
            id: id,
            waste: waste,
          ),
          HeightBox(),
          HeightBox(),
          HeightBox(),
          _HomeButton(),
        ],
      ),
    );
  }
}
