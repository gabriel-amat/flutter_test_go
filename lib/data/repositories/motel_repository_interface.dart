import '../../core/api_error.dart';
import '../models/data_model.dart';

abstract class MotelRepositoryInterface {
  Future<(DataModel, ApiError)> getMotels();
}
