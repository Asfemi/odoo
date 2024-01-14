

import 'package:dio/dio.dart';
import 'package:odoo/constants/constants.dart';
import 'package:odoo/data/models/timer_model.dart';


class ApiClient {
  final Dio _dio = Dio();

  Future<TimersData> fetchTimersData() async {
    try {
      Response response = await _dio.get(apiEndpoint);
      if (response.statusCode == 200) {
        return TimersData.fromJSON(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Failed to load data',
        );
      }
    } catch (error) {
      
      rethrow;
    }
  }
}

