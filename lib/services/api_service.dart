import 'dart:io';
import 'package:bloc_project/core/constants/app_constants.dart';
import 'package:bloc_project/model/launches.dart';
import 'package:dio/dio.dart';

class APIService {
  Future<List<Launches>> getAllLaunches() async {
    try {
      Response response = await Dio().get(AppConstants.endpoint);
      if (response.statusCode == HttpStatus.ok) {
        List result = response.data;
        return result.map((mission) => Launches.fromJson(mission)).toList();
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }
}
