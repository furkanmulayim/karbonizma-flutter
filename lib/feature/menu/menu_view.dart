import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:karbonizma/feature/common_widgets/space_boxes.dart';
import 'package:karbonizma/product/model/recycle_model.dart';
import 'package:karbonizma/product/repository/remoot/recycle_repository.dart';
import 'package:karbonizma/product/util/constant/app_colors.dart';
import 'package:karbonizma/product/util/constant/app_dimens.dart';
import 'package:karbonizma/feature/common_widgets/header_title.dart';

part 'menu_widgets.dart';

///MAin MEnu
class MenuView extends StatelessWidget {
  ///MAin MEnu Constructor
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app_name'.tr()),
        leading: _IconButton(),
      ),
      drawer: Drawer(
        child: _Drawer(),
      ),
      body: _MenuBody(),
    );
  }
}

class _MenuBody extends StatelessWidget {
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
          _DoubleButton(),
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
