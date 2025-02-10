import 'package:flutter/material.dart';
import 'package:flutter_test_guia/ui/shared/filter_icon.dart';

class MotelFilterWidget extends StatelessWidget {
  const MotelFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FilterIcon(icon: Icons.filter_alt_rounded, label: "filtros"),
          FilterIcon(label: "com desconto"),
          FilterIcon(label: "disponíveis"),
          FilterIcon(label: "hidro"),
          FilterIcon(label: "piscina"),
          FilterIcon(label: "sauna"),
          FilterIcon(label: "ofurô"),
        ],
      ),
    );
  }
}
