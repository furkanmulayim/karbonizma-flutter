import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:karbonizma/common/bloc/history_bloc/history_bloc.dart';
import 'package:karbonizma/common/data/model/history/history_model.dart';
import 'package:karbonizma/common/data/model/statis/statis_model.dart';
import 'package:karbonizma/common/data/repository/history_repository.dart';
import 'package:karbonizma/common/data/repository/statis_repository.dart';
import 'package:karbonizma/common/data/repository/recycle_repository.dart';
import 'package:karbonizma/common/data/service/recycle_service/recycle_api_service.dart';
import 'package:karbonizma/common/bloc/general_cubits/waste_cubit.dart';
import 'package:karbonizma/common/bloc/carbon_bloc/carbon_bloc.dart';
import 'package:karbonizma/common/bloc/general_cubits/statis_cubit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:karbonizma/core/routes/app_router.dart';
import 'package:karbonizma/common/data/model/recycle/recycle_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive'i başlat ve adaptörleri kaydet
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(StatisModelAdapter());
  Hive.registerAdapter(RecycleModelAdapter());
  Hive.registerAdapter(HistoryModelAdapter());

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
        BlocProvider(
          create: (_) => CarbonBloc(
            recycleRepo: RecycleRepository(
              apiService: RecycleApiService(),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => HistoryBloc(HistoryRepository()),
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
