import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:karbonizma/common/bloc/history_bloc/history_bloc.dart';
import 'package:karbonizma/common/data/model/history/history_model.dart';
import 'package:karbonizma/common/data/model/recycle/recycle_model.dart';
import 'package:karbonizma/common/data/repository/recycle_repository.dart';
import 'package:karbonizma/common/data/service/recycle_service/recycle_api_service.dart';
import 'package:karbonizma/core/constants/app_colors.dart';
import 'package:karbonizma/core/constants/app_dimens.dart';
import 'package:karbonizma/core/constants/app_texts.dart';
import 'package:karbonizma/core/widgets/app_bars/back_app_bar.dart';
import 'package:karbonizma/core/widgets/buttons/normal_button.dart';
import 'package:karbonizma/core/widgets/spacers/heightbox.dart';
import 'package:karbonizma/core/widgets/spacers/widthbox.dart';
import 'package:karbonizma/core/widgets/titles/header_title.dart';
import 'package:karbonizma/common/bloc/general_cubits/waste_cubit.dart';
import 'package:karbonizma/common/bloc/carbon_bloc/carbon_bloc.dart';
import 'package:karbonizma/common/bloc/general_cubits/statis_cubit.dart';

part '../widgets/header_container.dart';
part '../widgets/header_content.dart';
part '../widgets/waste_weight.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key, required this.id});

  final int id;

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  late final CarbonBloc homeBloc;

  @override
  void dispose() {
    homeBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    homeBloc = CarbonBloc(
      recycleRepo: RecycleRepository(
        apiService: RecycleApiService(),
      ),
      id: widget.id,
    );
    homeBloc.add(CarbonInitialEventById());
  }

  Widget _buildBody(CarbonState state) {
    if (state is CarbonLoadingState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is CarbonLoadingSuccessStateById) {
      return _DetailBody(item: state.waste);
    } else if (state is CarbonErrorState) {
      return const Center(child: Text('ERROR!!'));
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeBloc, // homeBloc burada sağlanıyor
      child: BlocBuilder<CarbonBloc, CarbonState>(
        builder: (context, state) {
          String appBarTitle = '';
          if (state is CarbonLoadingSuccessStateById) {
            appBarTitle = state.waste.name;
          }
          return Scaffold(
            appBar: BackAppBar(
              text: appBarTitle,
              backClick: () {
                context.go('/');
              },
            ),
            body: _buildBody(state),
          );
        },
      ),
    );
  }
}

class _DetailBody extends StatelessWidget {
  const _DetailBody({required this.item});

  final RecycleModel item;

  @override
  Widget build(BuildContext context) {
    final WasteCubit wasteCubit = context.read<WasteCubit>();
    final StatisCubit statisCubit = context.read<StatisCubit>();
    final HistoryBloc historyBloc = context.read<HistoryBloc>();

    int pers;
    int rat;
    return Center(
      child: Column(
        children: [
          HeaderContent(imageUrl: item.image, explain: item.explain),
          HeaderTitle(title: AppTexts.detailPageCarbonTitles),
          BlocBuilder<WasteCubit, int>(
            builder: (context, state) {
              pers = wasteCubit.calcPersentageValue(item.persentage);
              rat = wasteCubit.calcRatioValue(item.carbonRatio);
              return Column(
                children: [
                  _CarbonContent(
                    persentage: pers,
                    ratio: rat,
                  ),
                  _WasteWeight(
                      stater: state.toString(),
                      increaseWasteGram: wasteCubit.increase,
                      decreaseWasteGram: wasteCubit.decrease),
                  NormalButton(
                    onClick: () {
                      DateTime now = DateTime.now();
                      statisCubit.increasePoints(
                        ecoPoints: pers,
                        co2Point: rat,
                        totalPoint: 1,
                      );
                      historyBloc.add(
                        AddHistory(
                          HistoryModel(
                            id: item.id,
                            name: item.name,
                            image: item.image,
                            topEcoPoints: pers,
                            topCo2Points: rat,
                            date: DateFormat("d MMMM yyyy, HH:mm", "tr_TR")
                                .format(now),
                            kg: state.toString(),
                          ),
                        ),
                      );

                      context.go('/congrats/${item.name}/$state');
                    },
                    text: '${item.name} ${AppTexts.detailPageButton}',
                    icon: Icon(Icons.recycling, color: AppColors.textWhite),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
