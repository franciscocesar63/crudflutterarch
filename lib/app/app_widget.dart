import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      locale: const Locale("pt", "BR"),
      fallbackLocale: const Locale("pt", "BR"),
      title: "Sovis",
    );
  }
}
