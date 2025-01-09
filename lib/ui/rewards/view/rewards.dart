import 'package:flutter/cupertino.dart';
import 'package:karbonizma/common/bloc/carbon_bloc/carbon_bloc.dart';

class RewardsPage extends StatefulWidget {
  const RewardsPage({super.key});

  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
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
    return _RewardsBody();
  }
}

class _RewardsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        child: Center(
          child: Column(),
        ));
  }
}
