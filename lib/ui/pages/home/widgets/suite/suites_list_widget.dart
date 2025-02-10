import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../controllers/motel/motel_controller.dart';
import '../../../../../controllers/motel/motel_states.dart';
import '../../../../../core/locators.dart';
import '../../../../shared/custom_loading.dart';
import 'categoria_itens_widget.dart';
import 'suite_periodos.dart';
import 'suite_thumb.dart';

class SuitesListWidget extends StatelessWidget {
  const SuitesListWidget({
    super.key,
  });

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
          return SizedBox(
            height: 620,
            child: PageView(
              controller: PageController(viewportFraction: 0.97),
              padEnds: false,
              clipBehavior: Clip.none,
              children: state.data.moteis.first.suites.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Column(
                    children: [
                      SuiteThumb(suite: e),
                      SizedBox(height: 8),
                      CategoriaItensWidget(suite: e),
                      SizedBox(height: 8),
                      SuitePeriodos(suite: e),
                    ],
                  ),
                );
              }).toList(),
            ),
          );
        }

        return Center(child: Text("Ocorreu um erro inesperado"));
      },
    );
  }
}
