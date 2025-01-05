import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:karbonizma/core/constants/app_colors.dart';
import 'package:karbonizma/core/constants/app_dimens.dart';
import 'package:karbonizma/core/constants/app_texts.dart';
import 'package:karbonizma/core/widgets/buttons/normal_button.dart';
import 'package:karbonizma/core/widgets/spacers/heightbox.dart';
import 'package:lottie/lottie.dart';

part '../widgets/greeting_widgets.dart';

class GreetingView extends StatefulWidget {
  const GreetingView({super.key, required this.name, required this.waste});

  final String name;
  final int waste;

  @override
  State<GreetingView> createState() => _GreetingViewState();
}

class _GreetingViewState extends State<GreetingView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _GreetingBody(name: widget.name, waste: widget.waste));
  }
}

class _GreetingBody extends StatelessWidget {
  const _GreetingBody({required this.name, required this.waste});

  final String name;
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
            name: name,
            waste: waste,
          ),
          HeightBox(
            h: AppDimens.iconXLarge,
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
