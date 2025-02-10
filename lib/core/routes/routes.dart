import 'package:flutter/material.dart';
import 'package:flutter_test_guia/core/routes/app_pages.dart';
import 'package:flutter_test_guia/data/models/suite_model.dart';
import 'package:flutter_test_guia/ui/pages/home/home_page.dart';
import 'package:flutter_test_guia/ui/pages/images/images_page.dart';
import 'package:flutter_test_guia/ui/pages/itens/itens_page.dart';
import 'package:flutter_test_guia/ui/pages/search/search_page.dart';

class CustomRouter {
  static Route generateRoute(RouteSettings settings) {
    return switch (settings.name) {
      //
      AppPages.images => MaterialPageRoute(
          builder: (context) => ImagesPage(
            images: settings.arguments as List<String>,
          ),
        ),
      //
      AppPages.home => MaterialPageRoute(builder: (context) => HomePage()),
      //
      AppPages.itens => MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) => ItensPage(
            suite: settings.arguments as SuiteModel,
          ),
        ),
      //
      AppPages.search => MaterialPageRoute(builder: (context) => SearchPage()),
      //
      _ => MaterialPageRoute(builder: (context) => Container()),
    };
  }
}
