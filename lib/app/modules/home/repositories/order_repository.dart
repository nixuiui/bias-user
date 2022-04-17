import 'dart:convert';

import 'package:bias_user/app/models/order.dart';
import 'package:bias_user/services/network_service.dart';

class OrderRepository {

  var network = NetworkService.to;

  Future<List<Order>?> getList({
    int page = 1,
    int limit = 20
  }) async {
    try {
      var url = '/user/order';
      final response = await network.get(
        url: url,
        parameters: {
          'page': page,
          'limit': limit,
        }
      );
      return orderFromJson(
        json.encode(response.data['data']['order'])
      );
    } catch (e) {
      rethrow;
    }
  }

}