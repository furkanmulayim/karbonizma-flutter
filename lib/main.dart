import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:karbonizma/common/bloc/carbon_bloc/carbon_bloc.dart';
import 'package:karbonizma/common/bloc/general_cubits/statis_cubit.dart';
import 'package:karbonizma/common/bloc/general_cubits/waste_cubit.dart';
import 'package:karbonizma/common/bloc/history_bloc/history_bloc.dart';
import 'package:karbonizma/common/data/model/history/history_model.dart';
import 'package:karbonizma/common/data/model/privacy/privacy_model.dart';
import 'package:karbonizma/common/data/model/recycle/recycle_model.dart';
import 'package:karbonizma/common/data/model/rewards/rewards_model.dart';
import 'package:karbonizma/common/data/model/statis/statis_model.dart';
import 'package:karbonizma/common/data/repository/local/history_repo/history_repository.dart';
import 'package:karbonizma/common/data/repository/local/statis_repo/statis_repository.dart';
import 'package:karbonizma/common/data/service/recycle_service/recycle_api_service.dart';
import 'package:karbonizma/core/routes/app_router.dart';
import 'package:path_provider/path_provider.dart';

import 'common/bloc/general_cubits/rewards_cubit.dart';
import 'common/data/repository/remote/recycle_repo/recycle_repository_implement.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('tr_TR', null);

  // Hive'i başlat ve adaptörleri kaydet // singelton olarak bak -manager
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(StatisModelAdapter());
  Hive.registerAdapter(RecycleModelAdapter());
  Hive.registerAdapter(HistoryModelAdapter());
  Hive.registerAdapter(RewardsModelAdapter());
  Hive.registerAdapter(PrivacyModelAdapter());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WasteCubit()),
        BlocProvider(create: (_) => StatisCubit(StatisRepository())),
        BlocProvider(create: (_) => RewardsCubit(statisRepository: StatisRepository())),
        BlocProvider(
          create: (_) => CarbonBloc(
            recycleRepo: RecycleRepositoryImpl(
              apiService: GithubApiService(),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => HistoryBloc(
            HistoryRepository(),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
