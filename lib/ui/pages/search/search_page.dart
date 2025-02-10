import 'package:flutter/material.dart';

import '../../../controllers/navigation_controller.dart';
import '../../../core/locators.dart';
import '../../../core/theme/app_colors.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final route = locator.get<NavigationController>();

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "motel, bairro ou cidade",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        fillColor: AppColors.inputText,
                        filled: true,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      route.pop();
                    },
                    child: Text(
                      "cancelar",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
