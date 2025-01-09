import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:karbonizma/core/constants/app_texts.dart';
import 'package:karbonizma/core/widgets/app_bars/back_app_bar.dart';

class PrivacyPolicyView extends StatefulWidget {
  const PrivacyPolicyView({super.key});

  @override
  State<PrivacyPolicyView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      BackAppBar(text: AppTexts.rewards, backClick: () => context.go('/')),
      body: _PrivacyPolicyBody(),
    );
  }
}

class _PrivacyPolicyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        child: Center(
          child: Column(),
        ));
  }
}
