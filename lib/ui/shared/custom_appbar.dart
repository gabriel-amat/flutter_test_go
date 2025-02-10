import 'package:flutter/material.dart';
import 'package:flutter_test_guia/core/routes/app_pages.dart';

import '../../controllers/navigation_controller.dart';
import '../../core/locators.dart';
import '../pages/home/widgets/date_segmented_widget.dart';

class CustomAppbar extends StatelessWidget {
  final VoidCallback onDrawerTap;

  const CustomAppbar({super.key, required this.onDrawerTap});

  @override
  Widget build(BuildContext context) {
    final route = locator.get<NavigationController>();

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: onDrawerTap,
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return AnimatedSegmentedButton(
                          width: constraints.maxWidth,
                        );
                      },
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    route.push(routeName: AppPages.search);
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(),
                  child: Row(
                    children: [
                      Text(
                        "Araçatuba",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.dashed,
                          decorationColor: Colors.white,
                        ),
                      ),
                      Icon(Icons.arrow_downward, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
