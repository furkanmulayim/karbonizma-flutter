import 'package:flutter/material.dart';
import 'package:karbonizma/core/constants/app_colors.dart';
import 'package:karbonizma/core/constants/app_dimens.dart';
import 'package:karbonizma/core/constants/app_texts.dart';
import 'package:karbonizma/core/widgets/app_bars/flat_app_bar.dart';
import 'package:karbonizma/core/widgets/buttons/normal_button.dart';
import 'package:karbonizma/core/widgets/spacers/heightbox.dart';
import 'package:karbonizma/core/widgets/spacers/widthbox.dart';
import 'package:karbonizma/core/widgets/titles/header_title.dart';

part '../widgets/lazy_list.dart';
part '../widgets/drawer.dart';
part '../widgets/header_container.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FlatAppBar(
        text: AppTexts.homeName,
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
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          _HeaderContainers(eco: '12', co2: '100', re: '32',),
          NormalButton(onclick: () {}, text: AppTexts.homePageButton),
          HeaderTitle(title: AppTexts.homePageTitle),
          Flexible(
            child: _LazyList(),
          ),
        ],
      ),
    );
  }
}
