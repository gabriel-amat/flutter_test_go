abstract interface class ApiError {}

final class Failure implements ApiError {
  final String message;

  Failure({required this.message});
}

final class Empty implements ApiError {}
