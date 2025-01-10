import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:karbonizma/common/bloc/rewards_bloc/rewards_bloc_bloc.dart';
import 'package:karbonizma/common/data/model/rewards/rewards_model.dart';
import 'package:karbonizma/common/data/repository/rewards_repo/rewards_repository_implement.dart';
import 'package:karbonizma/common/data/service/recycle_service/recycle_api_service.dart';
import 'package:karbonizma/core/constants/app_texts.dart';
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
        body: BlocBuilder<RewardsBloc, RewardsState>(builder: (context, state) {
          switch (state) {
            case RewardsLoadingState(): //loading
              return Center(child: CircularProgressIndicator());
            case RewardsLoadingSuccessState(): //succes
              return _RewardsBody(items: state.rewards);
            case RewardsErrorState(): //error
              return Center(child: Text('HOME ERROR!!'));
            default: //default
              return Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}

class _RewardsBody extends StatelessWidget {
  final List<RewardsModel> items;

  const _RewardsBody({required this.items});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return ListTile(
                      title: Text(item.tokenID),
                      subtitle: Text("ID: ${item.id}"),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
