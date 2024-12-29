import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:karbonizma/core/widgets/app_bars/back_app_bar.dart';

class DetailView extends StatefulWidget {
  DetailView({required this.id});

  final int id; // Detay için gelen id

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(
          text: "Details",
          backClick: () {
            context.go('/');
          }),
    );
  }
}
