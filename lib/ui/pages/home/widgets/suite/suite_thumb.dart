import 'package:flutter/material.dart';
import 'package:flutter_test_guia/core/routes/app_pages.dart';
import 'package:flutter_test_guia/data/models/suite_model.dart';
import 'package:flutter_test_guia/ui/shared/custom_cached_image.dart';

import '../../../../../controllers/navigation_controller.dart';
import '../../../../../core/locators.dart';
import '../../../../../core/theme/app_text.dart';
import '../../../../../core/theme/app_theme.dart';

class SuiteThumb extends StatelessWidget {
  final SuiteModel suite;

  const SuiteThumb({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    final route = locator.get<NavigationController>();

    return InkWell(
      onTap: () {
        route.push(routeName: AppPages.images, args: suite.fotos);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            AppTheme.defaultBorder,
          ),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                AppTheme.defaultBorder,
              ),
              child: ImageNetworkWidget(
                url: suite.fotos.first,
                height: 200,
                width: double.maxFinite,
              ),
            ),
            SizedBox(height: 16),
            Text(suite.nome, style: AppText.title500),
            SizedBox(height: 8),
            if (suite.exibirQtdDisponiveis)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.red,
                    size: 16,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "Só mais ${suite.qtd} pelo app",
                    style: AppText.warning,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
