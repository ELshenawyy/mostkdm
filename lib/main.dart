import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostkdm/core/cache/cache_helper.dart';
import 'package:mostkdm/core/di/service_locator.dart';
import 'package:mostkdm/core/network/dio_client.dart';
import 'package:mostkdm/core/router/app_router.dart';
import 'package:mostkdm/core/theme/app_colors.dart';
import 'package:mostkdm/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:mostkdm/features/favorite/presentation/bloc/favorite_event.dart';
import 'package:mostkdm/features/favorite/presentation/bloc/follow_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  await DioClient().init();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final bloc = getIt<FavoritesBloc>();
            bloc.add(GetFavoritesEvent());
            return bloc;
          },
        ),
        BlocProvider(create: (context) {
          final bloc = getIt<FollowBloc>();
          bloc.add(GetFollowersEvent());
          return bloc;
        })
      ],
      child: MaterialApp.router(
        locale: const Locale('ar'),
        builder: (context, child) => Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        ),
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.backgroundColor,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
      ),
    );
  }
}
