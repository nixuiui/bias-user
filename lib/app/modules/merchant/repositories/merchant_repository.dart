import 'dart:convert';

import 'package:bias_user/app/models/merchant.dart';
import 'package:bias_user/services/network_service.dart';

class MerchantRepository {

  var network = NetworkService.to;

  Future<List<Merchant>?> getList({
    int page = 1,
    int limit = 20
  }) async {
    try {
      var url = '/user/merchant';
      final response = await network.get(
        url: url,
        parameters: {
          'page': page,
          'limit': limit,
        }
      );
      return listMerchantFromJson(
        json.encode(response.data['data']['merchant'])
      );
    } catch (e) {
      rethrow;
    }
  }

}