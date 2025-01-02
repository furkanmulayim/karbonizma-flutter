import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:karbonizma/core/constants/app_colors.dart';
import 'package:karbonizma/core/constants/app_dimens.dart';
import 'package:karbonizma/core/constants/app_texts.dart';
import 'package:karbonizma/core/widgets/buttons/normal_button.dart';
import 'package:karbonizma/core/widgets/spacers/heightbox.dart';
import 'package:lottie/lottie.dart';

part '../widgets/greeting_widgets.dart';

class GreetingView extends StatelessWidget {
  const GreetingView({required this.id, required this.waste, super.key});
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
          HeightBox(
            h: AppDimens.paddingXXLarge,
          ),
          NormalButton(
              onClick: () {
                context.go('/');
              },
              text: AppTexts.congratsButtonTitle)
        ],
      ),
    );
  }
}
