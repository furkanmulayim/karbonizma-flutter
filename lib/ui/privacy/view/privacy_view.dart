import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:karbonizma/common/bloc/privacy_bloc/privacy_bloc.dart';
import 'package:karbonizma/common/data/model/privacy/privacy_model.dart';
import 'package:karbonizma/common/data/repository/remote/privacy_repo/privacy_repository_implement.dart';
import 'package:karbonizma/common/data/service/recycle_service/recycle_api_service.dart';
import 'package:karbonizma/core/constants/app_dimens.dart';
import 'package:karbonizma/core/constants/app_texts.dart';
import 'package:karbonizma/core/theme/app_colors.dart';
import 'package:karbonizma/core/widgets/app_bars/back_app_bar.dart';
import 'package:karbonizma/core/widgets/spacers/heightbox.dart';
import 'package:karbonizma/core/widgets/spacers/widthbox.dart';
import 'package:url_launcher/url_launcher.dart';

part '../widgets/developer_profile_view.dart';

class PrivacyView extends StatefulWidget {
  const PrivacyView({super.key});

  @override
  State<PrivacyView> createState() => _PrivacyViewState();
}

class _PrivacyViewState extends State<PrivacyView> {
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
            text: AppTexts.appName, backClick: () => context.go('/')),
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
        child: DeveloperProfileView(privacyData: privacyData),
      ),
    );
  }
}
