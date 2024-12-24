import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:karbonizma/feature/list/bloc/list_bloc.dart';
import 'package:karbonizma/product/model/recycle_model.dart';
import 'package:karbonizma/product/repository/remoot/recycle_repository.dart';
import 'package:karbonizma/product/util/constant/app_colors.dart';

part 'list_view_widgets.dart';

///
class ListViewPage extends StatefulWidget {
  ///
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListState();
}

class _ListState extends State<ListViewPage> {
  @override
  void initState() {
    listBloc.add(ListInitialEvent());
    super.initState();
  }

  final listBloc = ListBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => listBloc,
      child: BlocConsumer<ListBloc, ListState>(
        bloc: listBloc,
        //listenWhen: (previous, current) {},
        //buildWhen: (previous, current) {},
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('recycle_title'.tr()),
            ),
            body: Center(
              child: Column(
                children: [
                  Flexible(
                    child: _LazyList(
                      items: RecycleRepository().recycleItems,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
