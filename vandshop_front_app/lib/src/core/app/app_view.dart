import 'package:flutter/material.dart';
import 'package:vandshop_front_app/src/core/di/injection_container.dart';
import 'package:vandshop_front_app/src/core/routes/app_router.dart';
import 'package:vandshop_front_app/src/core/utils/colors.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Palette.mainColor),
        useMaterial3: true,
      ),
      routerConfig: locator<AppRouter>().router,
    );
  }
}
