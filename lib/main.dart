import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karbonizma/feature/home/hello_cubit.dart';
import 'package:karbonizma/feature/recycle/recycle_cubit.dart';
import 'package:karbonizma/product/navigation/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(const MyApp());
}

///main app started
class MyApp extends StatelessWidget {
  ///main app consturctor
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HelloCubit>(
          create: (_) => HelloCubit(),
        ),
        BlocProvider<RecycleCubit>(
          create: (_) => RecycleCubit(1),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('tr')],
        path: 'assets/translations',
        fallbackLocale: const Locale('tr'),
        child: _HolaBody(),
      ),
    );
  }
}

///
class _HolaBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      routerConfig: AppRoutes.router,
    );
  }
}
