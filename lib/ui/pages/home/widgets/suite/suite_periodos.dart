import 'package:flutter/material.dart';
import 'package:flutter_test_guia/core/theme/app_text.dart';
import 'package:flutter_test_guia/core/theme/app_theme.dart';
import 'package:flutter_test_guia/data/models/suite_model.dart';

class SuitePeriodos extends StatelessWidget {
  final SuiteModel suite;

  const SuitePeriodos({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    if (suite.periodos.isEmpty) return SizedBox.shrink();

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: suite.periodos.length,
      itemBuilder: (context, index) {
        final item = suite.periodos[index];
        return Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppTheme.defaultBorder),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(item.tempoFormatado ?? "", style: AppText.title500),
                      if (item.desconto != null)
                        Container(
                          margin: EdgeInsets.only(left: 8),
                          padding: EdgeInsets.symmetric(
                            vertical: 3,
                            horizontal: 4,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.green,
                            ),
                            borderRadius: BorderRadius.circular(
                              AppTheme.defaultBorder,
                            ),
                          ),
                          child: Text(
                            "${item.desconto!.desconto}% off",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                    ],
                  ),
                  if (item.desconto != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "R\$ ${item.valor}",
                            style: AppText.title500.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text("R\$ ${item.valorTotal}",
                              style: AppText.title500)
                        ],
                      ),
                    )
                ],
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.grey)
            ],
          ),
        );
      },
    );
  }
}
