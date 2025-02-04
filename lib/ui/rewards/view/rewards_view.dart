import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:karbonizma/common/bloc/general_cubits/rewards_cubit.dart';
import 'package:karbonizma/common/bloc/rewards_bloc/rewards_bloc.dart';
import 'package:karbonizma/common/data/model/remaining/remaining_rewards.dart';
import 'package:karbonizma/common/data/model/rewards/rewards_model.dart';
import 'package:karbonizma/common/data/repository/remote/rewards_repo/rewards_repository_implement.dart';
import 'package:karbonizma/common/data/service/recycle_service/recycle_api_service.dart';
import 'package:karbonizma/core/constants/app_dimens.dart';
import 'package:karbonizma/core/constants/app_texts.dart';
import 'package:karbonizma/core/theme/app_colors.dart';
import 'package:karbonizma/core/widgets/app_bars/back_app_bar.dart';

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
            if (state is RewardsLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is RewardsLoadingSuccessState) {
              if (state.rewards.isEmpty) {
                return Center(child: Text('No rewards available'));
              }
              return _RewardsBody(rewards: state.rewards);
            } else {
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

    ///toDo
    return PopScope(
      canPop: true,
      child: Center(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppDimens.paddingMedium),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<RewardsCubit, List<RemainingModel>>(
                  builder: (context, list) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Her satırda 2 sütun
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 0.9, // Kare görünüm
                      ),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        final item = list[index];
                        return Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(item.showingImage,
                                    height: AppDimens.iconXXLarge,
                                    width: AppDimens.iconXXLarge,
                                    fit: BoxFit.cover),
                                SizedBox(height: 8),
                                Text(
                                  item.remainingPoint,
                                  style: TextStyle(
                                      fontSize: AppDimens.fontxMedium,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.accentGreen500),
                                ),
                                Text(
                                  item.details,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: AppDimens.fontMedium,
                                      color: AppColors.accentGreen500),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
