import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:karbonizma/feature/common_widgets/header_title.dart';
import 'package:karbonizma/feature/common_widgets/space_boxes.dart';
import 'package:karbonizma/feature/recycle/recycle_cubit.dart';
import 'package:karbonizma/product/repository/remoot/recycle_repository.dart';
import 'package:karbonizma/product/util/constant/app_colors.dart';
import 'package:karbonizma/product/util/constant/app_dimens.dart';
import 'package:lottie/lottie.dart';

part 'recycle_widgets.dart';

/// set recycle for recycable wastes
class RecycleView extends StatelessWidget {
  /// recycle constructor
  const RecycleView({required this.id, super.key});

  /// recycle waste id
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RecycleRepository().recycleItems[id].name),
        leading: IconButton(
          onPressed: () {
            context.go('/menu');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _LottieRecycle(),
          ),
        ],
      ),
      body: _RecycleBody(id: id),
    );
  }
}

class _RecycleBody extends StatelessWidget {
  const _RecycleBody({required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          HeightBox(),
          _PersentageTextRow(id: id),
          HeightBox(),
          _CustomText(id: id),
          HeaderTitle(title: 'waste_info'.tr()),
          BlocBuilder<RecycleCubit, int>(
            builder: (context, state) {
              return _WasteSize(
                stater: state.toString(),
                increaseWasteGram: context.read<RecycleCubit>().inc,
                decreaseWasteGram: context.read<RecycleCubit>().dec,
              );
            },
          ),
          HeightBox(),
          BlocBuilder<RecycleCubit, int>(
            builder: (context, state) {
              return _RecycleButton(id: id, waste: state);
            },
          ),
        ],
      ),
    );
  }
}
