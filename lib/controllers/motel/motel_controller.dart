import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/api_error.dart';
import '../../core/locators.dart';
import '../../data/repositories/motel_repository_interface.dart';
import '../../ui/shared/custom_snack.dart';
import 'motel_events.dart';
import 'motel_states.dart';

class MotelController extends Bloc<MotelEvent, MotelState> {
  MotelController({required this.motelRepository}) : super(MotelEmpty()) {
    on<GetMotels>(_getMotels);
  }

  final MotelRepositoryInterface motelRepository;
  CustomSnack get snack => locator.get<CustomSnack>();

  Future<void> _getMotels(event, emit) async {
    emit(MotelLoading());

    final (res, err) = await motelRepository.getMotels();

    if (err is Failure) {
      emit(MotelError(message: err.message));
      snack.error(text: err.message);
      return;
    }

    emit(MotelLoaded(data: res));
  }
}
