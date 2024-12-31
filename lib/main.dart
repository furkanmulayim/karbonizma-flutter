import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:karbonizma/ui/detail/bloc/detail_cubit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:karbonizma/core/routes/app_router.dart';
import 'package:karbonizma/common/data/model/recycle_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive'i başlat ve model adaptörünü kaydet
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(RecycleModelAdapter());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => DetailCubit())],
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
