import 'package:flutter/material.dart';
import 'package:mostkdm/core/router/app_router.dart';
import 'package:mostkdm/core/theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
