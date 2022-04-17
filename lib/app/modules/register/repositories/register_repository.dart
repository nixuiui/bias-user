import 'package:bias_user/app/models/user.dart';
import 'package:bias_user/services/network_service.dart';

class RegisterRepository {

  var network = NetworkService.to;

  Future<User?> login({
    required String fullName,
    required String phoneNumber,
    required String division,
    required String userName,
    required String password,
  }) async {
    try {
      var url = '/user/register';
      final response = await network.post(
        url: url, 
        data: {
          "fullName": fullName,
          "phoneNumber": phoneNumber,
          "division": division,
          "userName": userName,
          "password": password,
        }
      );
      print('response: ${response.data["data"]}');
      print('response user: ${User.fromJson(response.data['data']).toJson()}');
      return User.fromJson(response.data['data']);
    } catch (e) {
      rethrow;
    }
  }

}