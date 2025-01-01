// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:karbonizma/common/data/model/recycle_model.dart';
import 'package:karbonizma/common/data/repository/user_repository.dart';
import 'package:karbonizma/common/data/service/recycle_service/recycle_api_service.dart';
import 'package:karbonizma/core/constants/app_colors.dart';
import 'package:karbonizma/core/constants/app_dimens.dart';
import 'package:karbonizma/core/constants/app_texts.dart';
import 'package:karbonizma/core/widgets/app_bars/flat_app_bar.dart';
import 'package:karbonizma/core/widgets/buttons/normal_button.dart';
import 'package:karbonizma/core/widgets/titles/header_title.dart';
import 'package:karbonizma/ui/home/bloc/home_bloc.dart';

part '../widgets/drawer.dart';
part '../widgets/header_container.dart';
part '../widgets/lazy_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = HomeBloc(
        recycleRepo: RecycleRepository(apiService: RecycleApiService()));
    homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeBloc,
      child: Scaffold(
        appBar: FlatAppBar(
          text: AppTexts.homeName,
        ),
        drawer: Drawer(
          child: _Drawer(),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            switch (state) {
              case HomeLoadingState(): //loading
                return Center(child: CircularProgressIndicator());
              case HomeLoadingSuccessState(): //succes
                return _MenuBody(items: state.waste);
              case HomeErrorState(): //error
                return Center(child: Text('ERROR!!'));
              default: //default
                return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class _MenuBody extends StatelessWidget {
  const _MenuBody({required this.items});
  final List<RecycleModel> items;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          HeaderTitle(title: AppTexts.homePagePointTitles),
          _HeaderContainers(
            eco: '12',
            co2: '100',
            re: '32',
          ),
          NormalButton(
            onClick: () {},
            text: AppTexts.homePageButton,
            icon: Icon(
              Icons.history,
              color: AppColors.textWhite,
            ),
          ),
          HeaderTitle(title: AppTexts.homePageListTitle),
          Flexible(
            child: _LazyList(items: items),
          ),
        ],
      ),
    );
  }
}
