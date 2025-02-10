import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../controllers/motel/motel_controller.dart';
import '../../../../controllers/motel/motel_states.dart';
import '../../../../core/locators.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../shared/custom_loading.dart';

class DropCard extends StatelessWidget {
  const DropCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MotelController, MotelState>(
      bloc: locator.get<MotelController>(),
      builder: (context, state) {
        if (state is MotelLoading && state is! MotelError) {
          return CustomLoading();
        }
        if (state is MotelError) {
          return Center(child: Text(state.message));
        }
        if (state is MotelLoaded) {
          return Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                AppTheme.defaultBorder,
              ),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppTheme.defaultBorder),
                  child: Image.network(
                    state.data.moteis.first.logo,
                    height: 200,
                    width: 150,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(width: 8),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(FontAwesomeIcons.fire, color: Colors.red),
                          SizedBox(width: 8),
                          Column(
                            children: [
                              Text(
                                "drops araçatuba",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              Text("araçatuba"),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        "30% de desconto",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text("a partir de R\$ 90,45"),
                      SizedBox(height: 16),
                      SizedBox(
                        width: double.maxFinite,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.button,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          iconAlignment: IconAlignment.end,
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: Colors.white,
                          ),
                          label: Text("Reservar"),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }
        return Center(child: Text('Erro inesperado'));
      },
    );
  }
}
