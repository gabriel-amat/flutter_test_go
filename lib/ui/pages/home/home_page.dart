import 'package:flutter/material.dart';
import 'package:flutter_test_guia/controllers/motel/motel_events.dart';
import 'package:flutter_test_guia/core/theme/app_colors.dart';
import 'package:flutter_test_guia/ui/pages/home/widgets/drop_card.dart';
import 'package:flutter_test_guia/ui/pages/home/widgets/location_description_widget.dart';
import 'package:flutter_test_guia/ui/pages/home/widgets/motel_filter_widget.dart';
import 'package:flutter_test_guia/ui/pages/home/widgets/suite/suites_list_widget.dart';
import 'package:flutter_test_guia/ui/shared/custom_divider.dart';

import '../../../controllers/motel/motel_controller.dart';
import '../../../core/locators.dart';
import '../../../core/theme/app_theme.dart';
import '../../shared/custom_appbar.dart';
import 'widgets/drawer/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffKey = GlobalKey<ScaffoldState>();
  final motelController = locator.get<MotelController>();

  @override
  void initState() {
    motelController.add(GetMotels());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffKey,
      drawer: CustomDrawer(),
      body: Stack(
        children: [
          CustomAppbar(
            onDrawerTap: () {
              scaffKey.currentState!.openDrawer();
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 170),
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppTheme.defaultBorder),
                topRight: Radius.circular(AppTheme.defaultBorder),
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DropCard(),
                        SizedBox(height: 16),
                        MotelFilterWidget(),
                        CustomDivider(),
                        LocationDescriptionWidget(),
                        SizedBox(height: 16),
                        SuitesListWidget(),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
