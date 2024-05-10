import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet/cubit/createprofile_cubit.dart';
import 'package:kemet/cubit/home_cubit_cubit.dart';
import 'package:kemet/cubit/image_cubit_cubit.dart';
import 'package:kemet/cubit/logout_cubit.dart';
import 'package:kemet/logic/cache/cache_helper.dart';
import 'package:kemet/logic/core/api/dio_consumer.dart';
import 'package:kemet/providers/theme_provider.dart';
import 'package:kemet/screens/logo.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const Kemet());
}

class Kemet extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const Kemet({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => LogoutCubit(),
              ),
              BlocProvider(
                create: (context) =>
                    createprofileCubit(api: DioConsumer(dio: Dio())),
              ),
      //         BlocProvider(
      // create: (context) => UserDataCubit(api: DioConsumer(dio: Dio()))),
            ],
            child: ChangeNotifierProvider(
              create: (_) => ThemeProvider(),
              child:
                  Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  //theme: ThemeData.light(),
                  //darkTheme: ThemeData.dark(),
                  //themeMode: currentMode,
                  theme: ThemeData.light(),
                  darkTheme: ThemeData.dark(),
                  themeMode: themeProvider.themeMode == ThemeModeType.dark
                      ? ThemeMode.dark
                      : ThemeMode.light,

                  home: Logo(),
                );
              }),
            ),
          );
        });
  }
}
