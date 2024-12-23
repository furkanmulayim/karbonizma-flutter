import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:karbonizma/feature/home/hello_cubit.dart';
import 'package:karbonizma/feature/home/hello_state.dart';

part '../common_widgets/custom_appbar.dart';

///Language Page
class HelloView extends StatelessWidget {
  ///Language Page Constructor
  const HelloView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'app_name'.tr()),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<HelloCubit, TestState>(
          builder: _savedChanges,
        ),
      ),
    );
  }

  Widget _savedChanges(BuildContext context, TestState state) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<HelloCubit>().setLocale(const Locale('tr'));
              context.go('/menu');
            },
            child: const Text('T Ü R K Ç E'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<HelloCubit>().setLocale(const Locale('en'));
              context.go('/menu');
            },
            child: const Text('E N G L I S H'),
          ),
        ],
      ),
    );
  }
}
