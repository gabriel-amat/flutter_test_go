import 'package:flutter_test_guia/data/models/data_model.dart';

sealed class MotelState {}

class MotelEmpty extends MotelState {}

class MotelLoading extends MotelState {}

class MotelLoaded extends MotelState {
  final DataModel data;

  MotelLoaded({required this.data});
}

class MotelError extends MotelState {
  final String message;
  MotelError({required this.message});
}
