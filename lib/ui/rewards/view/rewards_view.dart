import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:karbonizma/common/bloc/rewards_bloc/rewards_bloc.dart';
import 'package:karbonizma/common/data/model/remaining/remaining_rewards.dart';
import 'package:karbonizma/common/data/model/rewards/rewards_model.dart';
import 'package:karbonizma/common/data/repository/remote/rewards_repo/rewards_repository_implement.dart';
import 'package:karbonizma/common/data/service/recycle_service/recycle_api_service.dart';
import 'package:karbonizma/core/constants/app_texts.dart';
import 'package:karbonizma/core/widgets/app_bars/back_app_bar.dart';

import '../../../common/bloc/general_cubits/rewards_cubit.dart';

class RewardsView extends StatefulWidget {
  const RewardsView({super.key});

  @override
  State<RewardsView> createState() => _RewardsViewState();
}

class _RewardsViewState extends State<RewardsView> {
  late final RewardsBloc rewardsBloc;

  @override
  void initState() {
    super.initState();
    rewardsBloc = RewardsBloc(
        rewardsRepository:
            RewardsRepositoryImpl(apiService: GithubApiService()));
    rewardsBloc.add(ReweardsInitialEvent());
  }

  @override
  void dispose() {
    rewardsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => rewardsBloc,
      child: Scaffold(
        appBar: BackAppBar(
            text: AppTexts.rewards, backClick: () => context.go('/')),
        body: BlocBuilder<RewardsBloc, RewardsState>(
          builder: (context, state) {
            switch (state) {
              case RewardsLoadingState(): //loading
                return Center(child: CircularProgressIndicator());
              case RewardsLoadingSuccessState(): //success
                if (state.rewards.isEmpty) {
                  return Center(child: Text('No rewards available'));
                }
                return _RewardsBody(rewards: state.rewards);
              case RewardsErrorState(): //error
                return Center(child: Text(AppTexts.err));
              default: //default
                return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class _RewardsBody extends StatelessWidget {
  final List<RewardsModel> rewards;

  const _RewardsBody({required this.rewards});

  @override
  Widget build(BuildContext context) {
    final RewardsCubit rc = context.read<RewardsCubit>();
    rc.fetchHistory(rewards);
    return PopScope(
        canPop: true,
        child: Center(
          child: Column(
            children: [
              BlocBuilder<RewardsCubit, List<RemainingModel>>(
                builder: (context, list) {
                  if (list.isEmpty) {
                    return Center(
                      child: Text(
                        'LA DAHA DÖNÜŞÜM YAPMADIN ',
                      ),
                    );
                  }
                  return Column(children: [
                    Text("LISTE BOYUT: ${list.length.toString()}")
                  ]);
                },
              ),
            ],
          ),
        ));
  }
}
