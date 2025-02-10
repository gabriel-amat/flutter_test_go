import 'package:flutter/material.dart';
import 'package:flutter_test_guia/core/theme/app_text.dart';
import 'package:flutter_test_guia/ui/shared/star_widget.dart';

class LocationDescriptionWidget extends StatelessWidget {
  const LocationDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlutterLogo(size: 40),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("drops Araçatuba", style: AppText.bigTitle400),
            Text("Araçatuba", style: AppText.normal),
            Row(
              children: [
                StarWidget(),
                Text(
                  "99 avaliações",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ],
        ),
        Icon(Icons.favorite, size: 40, color: Colors.grey),
      ],
    );
  }
}
