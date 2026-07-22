import 'package:flutter/material.dart';
import 'package:mostkdm/core/cache/cache_helper.dart';
import 'package:mostkdm/core/network/dio_client.dart';
import 'package:mostkdm/core/router/app_router.dart';
import 'package:mostkdm/core/theme/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init(); 
  await DioClient().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
    );
  }
}
