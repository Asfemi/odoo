import 'dart:developer';

import 'package:odoo/data/dataproviders/api_client.dart';
import 'package:odoo/data/models/timer_model.dart';

class TimersRepository {
  final ApiClient apiClient;

  TimersRepository({required this.apiClient});

  Future<List<TimersData>> getTimersData() async {
    try {
      final TimersData timersJson = await apiClient.fetchTimersData();
      if (timersJson is Map<String, dynamic>) {
        List<TimersData> timersDataList =
            timersJson.map((json) => TimersData.fromJSON(json)).toList();
        return timersDataList;
      } else {
        throw Exception('Invalid API response structure');
      }
    } catch (error) {
      log('Error processing Data: $error');
      throw Exception('Failed to fetch timers data');
    }
  }
}
