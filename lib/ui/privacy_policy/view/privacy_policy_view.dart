import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:karbonizma/common/bloc/privacy_bloc/privacy_bloc.dart';
import 'package:karbonizma/common/data/model/privacy/privacy_model.dart';
import 'package:karbonizma/common/data/repository/remote/privacy_repo/privacy_repository_implement.dart';
import 'package:karbonizma/common/data/service/recycle_service/recycle_api_service.dart';
import 'package:karbonizma/core/constants/app_dimens.dart';
import 'package:karbonizma/core/constants/app_texts.dart';
import 'package:karbonizma/core/widgets/app_bars/back_app_bar.dart';

part '../widgets/privacy_policy_widget.dart';

class PrivacyPolicyView extends StatefulWidget {
  const PrivacyPolicyView({super.key});

  @override
  State<PrivacyPolicyView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
  late final PrivacyBloc privacyBloc;

  @override
  void dispose() {
    privacyBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    privacyBloc = PrivacyBloc(
        repository: PrivacyRepositoryImplement(apiService: GithubApiService()));
    privacyBloc.add(PrivacyInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => privacyBloc,
      child: Scaffold(
        appBar: BackAppBar(
            text: AppTexts.privacy, backClick: () => context.go('/')),
        body: BlocBuilder<PrivacyBloc, PrivacyState>(builder: (context, state) {
          switch (state) {
            case PrivacyLoadingState(): //loading
              return Center(child: CircularProgressIndicator());
            case PrivacyLoadingSuccesState(): //succes
              return _PrivacyPolicyBody(privacyData: state.privacyPolicy);
            case PrivacyErrorState(): //error
              return Center(child: Text('HOME ERROR!!'));
            default: //default
              return Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}

class _PrivacyPolicyBody extends StatelessWidget {
  const _PrivacyPolicyBody({required this.privacyData});

  final PrivacyModel privacyData;

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        child: Center(
          child: Column(
            children: [
              Flexible(child: _PrivacyScreen(privacyData: privacyData)),
            ],
          ),
        ));
  }
}
