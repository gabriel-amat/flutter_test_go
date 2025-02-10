import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/io_client.dart';

import '../../core/api_error.dart';
import '../models/data_model.dart';

class MotelRemoteDataSource {
  final IOClient client;

  MotelRemoteDataSource({required this.client});

  Future<(DataModel, ApiError)> getLocations() async {
    debugPrint("--GetLocations--");
    try {
      final res = await client.get(
        Uri.parse("https://jsonkeeper.com/b/1IXK"),
      );

      final map = jsonDecode(res.body);
      final data = DataModel.fromJson(map['data']);

      return (data, Empty());
    } on HttpException catch (e) {
      debugPrint("GetLocation error: ${e.message}");
      return (DataModel.empty(), Failure(message: e.message));
    }
  }
}
