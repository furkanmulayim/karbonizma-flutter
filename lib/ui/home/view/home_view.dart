import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:karbonizma/common/bloc/carbon_bloc/carbon_bloc.dart';
import 'package:karbonizma/common/bloc/general_cubits/statis_cubit.dart';
import 'package:karbonizma/common/data/model/recycle/recycle_model.dart';
import 'package:karbonizma/common/data/model/statis/statis_model.dart';
import 'package:karbonizma/common/data/repository/remote/recycle_repo/recycle_repository_implement.dart';
import 'package:karbonizma/common/data/service/recycle_service/recycle_api_service.dart';
import 'package:karbonizma/core/constants/app_dimens.dart';
import 'package:karbonizma/core/constants/app_texts.dart';
import 'package:karbonizma/core/theme/app_colors.dart';
import 'package:karbonizma/core/widgets/app_bars/flat_app_bar.dart';
import 'package:karbonizma/core/widgets/buttons/normal_button.dart';
import 'package:karbonizma/core/widgets/buttons/sized_button.dart';
import 'package:karbonizma/core/widgets/spacers/widthbox.dart';
import 'package:karbonizma/core/widgets/titles/header_title.dart';
import 'package:package_info_plus/package_info_plus.dart';

part '../widgets/drawer.dart';
part '../widgets/header_container.dart';
part '../widgets/lazy_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final CarbonBloc homeBloc;
  String _appVersion = '';

  @override
  void initState() {
    super.initState();
    _loadAppVersion();
    homeBloc = CarbonBloc(
      recycleRepo: RecycleRepositoryImpl(apiService: GithubApiService()),
    );
    homeBloc.add(CarbonInitialEvent());
    context.read<StatisCubit>().loadHistory();
  }

  @override
  void dispose() {
    homeBloc.close();
    super.dispose();
  }

  void _loadAppVersion() {
    PackageInfo.fromPlatform().then((packageInfo) {
      setState(() {
        _appVersion = packageInfo.version;
      });
    });
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
          child: _Drawer(
            versData: _appVersion,
          ),
        ),
        body: BlocBuilder<CarbonBloc, CarbonState>(
          builder: (context, state) {
            switch (state) {
              case CarbonLoadingState(): //loading
                return Center(child: CircularProgressIndicator());
              case CarbonLoadingSuccessState(): //succes
                return _MenuBody(items: state.waste);
              case CarbonErrorState(): //error
                return Center(child: Text('HOME ERROR!!'));
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
    return PopScope(
      canPop: false,
      child: Column(
        children: [
          HeaderTitle(title: AppTexts.homePagePointTitles),
          BlocBuilder<StatisCubit, StatisModel>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _HeaderContainers(
                    eco: state.ecoPoints.toString(),
                    co2: state.co2Point.toString(),
                    re: state.totalPoint.toString(),
                  ),
                ],
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: NormalButton(
                  onClick: () {
                    context.go("/history");
                  },
                  text: AppTexts.homePageButton,
                  icon: Icon(
                    Icons.history,
                    color: AppColors.accentGreenBackground,
                  ),
                ),
              ),
              Expanded(
                child: SizedButton(
                  onClick: () {
                    context.go("/rewards");
                  },
                  text: AppTexts.rewards,
                  icon: Icon(
                    Icons.military_tech,
                    color: AppColors.accentGreenBackground,
                  ),
                ),
              ),
            ],
          ),
          HeaderTitle(title: AppTexts.homePageListTitle),
          Expanded(
            // Bu, LazyList’in kalan tüm boş alanı kaplamasını sağlar
            child: _LazyList(items: items),
          ),
        ],
      ),
    );
  }
}
