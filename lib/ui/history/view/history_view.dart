import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:karbonizma/common/bloc/history_bloc/history_bloc.dart';
import 'package:karbonizma/common/data/model/history/history_model.dart';
import 'package:karbonizma/common/data/repository/history_repository.dart';
import 'package:karbonizma/core/constants/app_colors.dart';
import 'package:karbonizma/core/constants/app_dimens.dart';
import 'package:karbonizma/core/widgets/app_bars/back_app_bar.dart';
import 'package:karbonizma/core/widgets/spacers/heightbox.dart';
import 'package:karbonizma/core/widgets/spacers/widthbox.dart';
import 'package:karbonizma/ui/history/widgets/pie_chart.dart';

part '../widgets/waste_card.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  late final HistoryBloc historyBloc;

  @override
  void initState() {
    super.initState();
    historyBloc = HistoryBloc(HistoryRepository());
    historyBloc.add(FetchAllHistories());
  }

  @override
  void dispose() {
    historyBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => historyBloc,
      child: PopScope(
        canPop: false,
        child: Scaffold(
          appBar: BackAppBar(
            text: "History",
            backClick: () {
              context.go('/');
            },
          ),
          body: BlocBuilder<HistoryBloc, HistoryState>(
            builder: (context, state) {
              if (state is HistoryLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is HistoryLoaded) {
                return WasteList(wasteItems: state.histories.reversed.toList());
              } else if (state is HistoryError) {
                return Center(child: Text(state.message));
              }
              return Center(child: Text("No data"));
            },
          ),
        ),
      ),
    );
  }
}

class WasteList extends StatelessWidget {
  const WasteList({super.key, required this.wasteItems});

  final List<HistoryModel> wasteItems;

  @override
  Widget build(BuildContext context) {
    if (wasteItems.isNotEmpty) {
      return historyPageBuild();
    } else {
      return Center(
        child: Text("no data"),
      );
    }
  }

  Widget historyPageBuild() {
    return SingleChildScrollView(
      child: Column(
        children: [
          PieChartFromWasteItems(wasteItems: wasteItems), // Pie chart widget
          SizedBox(height: 20), // Optional space between the two widgets
          ListView.builder(
            itemCount: wasteItems.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _WasteCard(item: wasteItems[index]);
            },
          ),
        ],
      ),
    );
  }
}
