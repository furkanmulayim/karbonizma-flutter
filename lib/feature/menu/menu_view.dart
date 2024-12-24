// ignore_for_file: unnecessary_type_check

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:karbonizma/feature/common_widgets/header_title.dart';
import 'package:karbonizma/feature/common_widgets/space_boxes.dart';
import 'package:karbonizma/feature/menu/bloc/menu_bloc.dart';
import 'package:karbonizma/product/model/recycle_model.dart';
import 'package:karbonizma/product/repository/remoot/recycle_repository.dart';
import 'package:karbonizma/product/util/constant/app_colors.dart';
import 'package:karbonizma/product/util/constant/app_dimens.dart';

part 'menu_widgets.dart';

///MAin MEnu
class MenuView extends StatelessWidget {
  ///MAin MEnu Constructor
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final menuBloc = MenuBloc();
    return BlocProvider(
      create: (context) => menuBloc,
      child: BlocConsumer<MenuBloc, MenuState>(
        bloc: menuBloc,
        listenWhen: (previous, current) => current is MenuState,
        buildWhen: (previous, current) => current is! MenuState,
        listener: (context, state) {
          if (state is MenuNavigateToListPageActionState) {
            context.go('/list');
          } else {
            debugPrint('**??**');
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('app_name'.tr()),
              leading: _IconButton(),
            ),
            drawer: Drawer(
              child: _Drawer(),
            ),
            body: _MenuBody(menuBloc: menuBloc),
          );
        },
      ),
    );
  }
}

class _MenuBody extends StatelessWidget {
  const _MenuBody({required this.menuBloc});

  final MenuBloc menuBloc;

  @override
  Widget build(Object context) {
    return Center(
      child: Column(
        children: [
          HeightBox(),
          _HeaderContainers(),
          const SizedBox(
            height: AppDimens.paddingMedium,
          ),
          _DoubleButton(menuBloc: menuBloc),
          HeaderTitle(title: 'recycle_title'.tr()),
          Flexible(
            child: _LazyList(
              items: RecycleRepository().recycleItems,
            ),
          ),
        ],
      ),
    );
  }
}
