import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:karbonizma/common/data/model/recycle_model.dart';
import 'package:karbonizma/common/data/repository/user_repository.dart';
import 'package:karbonizma/common/data/service/recycle_service/recycle_api_service.dart';
import 'package:karbonizma/core/constants/app_colors.dart';
import 'package:karbonizma/core/constants/app_dimens.dart';
import 'package:karbonizma/core/constants/app_texts.dart';
import 'package:karbonizma/core/widgets/app_bars/back_app_bar.dart';
import 'package:karbonizma/core/widgets/buttons/normal_button.dart';
import 'package:karbonizma/core/widgets/spacers/heightbox.dart';
import 'package:karbonizma/core/widgets/spacers/widthbox.dart';
import 'package:karbonizma/ui/detail/bloc/detail_bloc.dart';
import 'package:karbonizma/ui/detail/bloc/detail_cubit.dart';

part '../widgets/header_content.dart';
part '../widgets/waste_weight.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key, required this.id});

  final int id;

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  late final DetailBloc detailBloc;

  @override
  void initState() {
    super.initState();
    detailBloc = DetailBloc(
        recycleRepo: RecycleRepository(
          apiService: RecycleApiService(),
        ),
        id: widget.id);
    detailBloc.add(DetailInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => detailBloc,
      child: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          String appBarTitle = '';
          if (state is DetailLoadingSuccessState) {
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

  Widget _buildBody(DetailState state) {
    if (state is DetailLoadingState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is DetailLoadingSuccessState) {
      return _DetailBody(item: state.waste);
    } else if (state is DetailErrorState) {
      return const Center(child: Text('ERROR!!'));
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}

class _DetailBody extends StatelessWidget {
  const _DetailBody({required this.item});

  final RecycleModel item;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          HeaderContent(
              imageUrl: item.image, name: item.name, explain: item.explain),
          BlocBuilder<DetailCubit, int>(
            builder: (context, state) {
              return Column(
                children: [
                  _WasteWeight(
                      stater: state.toString(),
                      increaseWasteGram: context.read<DetailCubit>().increase,
                      decreaseWasteGram: context.read<DetailCubit>().decrease)
                ],
              );
            },
          ),
          NormalButton(
            onClick: () {},
            text: '${item.name} ${AppTexts.detailPageButton}',
            icon: Icon(
              Icons.recycling,
              color: AppColors.textWhite,
            ),
          ),
        ],
      ),
    );
  }
}
