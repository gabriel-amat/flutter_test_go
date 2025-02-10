import 'package:flutter_test_guia/core/api_error.dart';
import 'package:flutter_test_guia/data/models/data_model.dart';
import 'package:flutter_test_guia/data/repositories/motel_repository_interface.dart';
import 'package:flutter_test_guia/data/sources/motel_remote_data_source.dart';

class MotelRepository implements MotelRepositoryInterface {
  final MotelRemoteDataSource remoteDataSource;

  MotelRepository({required this.remoteDataSource});

  @override
  Future<(DataModel, ApiError)> getMotels() async {
    return await remoteDataSource.getLocations();
  }
}
