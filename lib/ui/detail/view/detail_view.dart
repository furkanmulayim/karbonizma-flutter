import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:karbonizma/common/data/model/recycle_model.dart';
import 'package:karbonizma/common/data/repository/user_repository.dart';
import 'package:karbonizma/common/data/service/recycle_service/recycle_api_service.dart';
import 'package:karbonizma/core/constants/app_colors.dart';
import 'package:karbonizma/core/constants/app_dimens.dart';
import 'package:karbonizma/core/widgets/app_bars/back_app_bar.dart';
import 'package:karbonizma/core/widgets/spacers/heightbox.dart';
import 'package:karbonizma/core/widgets/spacers/widthbox.dart';
import 'package:karbonizma/ui/detail/bloc/detail_bloc.dart';

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
      child: Scaffold(
        appBar: BackAppBar(
            text: "Details",
            backClick: () {
              context.go('/');
            }),
        body: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            switch (state) {
              case DetailLoadingState(): //loading
                return Center(child: CircularProgressIndicator());
              case DetailLoadingSuccessState(): //succes
                return _DetailBody(item: state.waste);
              case DetailErrorState(): //error
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
          WasteWeight(),
        ],
      ),
    );
  }
}
