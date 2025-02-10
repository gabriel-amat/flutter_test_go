import 'package:flutter/material.dart';
import 'package:flutter_test_guia/core/routes/app_pages.dart';
import 'package:flutter_test_guia/ui/shared/custom_cached_image.dart';

import '../../../../../controllers/navigation_controller.dart';
import '../../../../../core/locators.dart';
import '../../../../../core/theme/app_text.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../data/models/suite_model.dart';

class CategoriaItensWidget extends StatelessWidget {
  final SuiteModel suite;

  const CategoriaItensWidget({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    final route = locator.get<NavigationController>();

    if (suite.categoriaItens.isEmpty) return SizedBox.shrink();

    return InkWell(
      onTap: () {
        route.push(routeName: AppPages.itens, args: suite);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            AppTheme.defaultBorder,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageNetworkWidget(
              url: suite.categoriaItens[0].icone,
              height: 50,
              width: 50,
            ),
            SizedBox(width: 8),
            if (suite.categoriaItens.length > 1)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.network(
                  suite.categoriaItens[1].icone,
                  height: 50,
                ),
              ),
            Text("Ver todos", style: AppText.normal),
            Icon(Icons.arrow_drop_down, color: Colors.grey)
          ],
        ),
      ),
    );
  }
}
