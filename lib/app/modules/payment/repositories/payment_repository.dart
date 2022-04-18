import 'package:bias_user/app/models/payment.dart';
import 'package:bias_user/services/network_service.dart';

class PaymentRepository {

  var network = NetworkService.to;

  Future<Payment?> pay({
    required String merchant,
    required int totalBuy,
    required String note,
  }) async {
    try {
      var url = '/user/order';
      final response = await network.post(
        url: url, 
        data: {
          "merchant": merchant,
          "totalBuy": totalBuy,
          "note": note,
        }
      );
      print('response: ${response.data["data"]}');
      print('response user: ${Payment.fromJson(response.data['data']).toJson()}');
      return Payment.fromJson(response.data['data']);
    } catch (e) {
      rethrow;
    }
  }

}