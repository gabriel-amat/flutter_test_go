import 'package:flutter/material.dart';
import 'controllers/navigation_controller.dart';
import 'core/locators.dart';
import 'core/routes/app_pages.dart';
import 'core/routes/routes.dart';
import 'core/theme/app_theme.dart';
import 'ui/shared/custom_snack.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Moteis",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(),
      scaffoldMessengerKey: locator.get<CustomSnack>().snackbarKey,
      //Route config
      initialRoute: AppPages.home,
      onGenerateRoute: CustomRouter.generateRoute,
      navigatorKey: locator.get<NavigationController>().navigatorKey,
      //End route config
    );
  }
}
