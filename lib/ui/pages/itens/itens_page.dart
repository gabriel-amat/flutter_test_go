import 'package:flutter/material.dart';
import 'package:flutter_test_guia/core/theme/app_text.dart';
import 'package:flutter_test_guia/data/models/suite_model.dart';
import 'package:flutter_test_guia/ui/shared/custom_cached_image.dart';

import '../../../controllers/navigation_controller.dart';
import '../../../core/locators.dart';

class ItensPage extends StatelessWidget {
  final SuiteModel suite;

  const ItensPage({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    final route = locator.get<NavigationController>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            route.pop();
          },
          icon: Icon(Icons.arrow_drop_down),
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Suites", style: AppText.bigTitle400),
            SizedBox(height: 16),
            if (suite.categoriaItens.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(flex: 1, child: Divider()),
                        Flexible(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 22),
                            child: Text(
                              "Principais itens",
                              style: AppText.title500,
                            ),
                          ),
                        ),
                        Flexible(flex: 1, child: Divider()),
                      ],
                    ),
                    SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      direction: Axis.horizontal,
                      children: suite.categoriaItens.map((e) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ImageNetworkWidget(url: e.icone, height: 50),
                            SizedBox(width: 8),
                            Text(e.nome, style: AppText.normal)
                          ],
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            if (suite.itens.isNotEmpty)
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(flex: 1, child: Divider()),
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          child: Text("Tem também", style: AppText.title500),
                        ),
                      ),
                      Flexible(flex: 1, child: Divider()),
                    ],
                  ),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    direction: Axis.horizontal,
                    children: suite.itens.map((e) {
                      return Chip(label: Text(e.nome));
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
