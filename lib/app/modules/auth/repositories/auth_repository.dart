import 'package:bias_user/app/models/user.dart';
import 'package:bias_user/services/network_service.dart';

class AuthRepository {

  var network = NetworkService.to;

  Future<User?> login({
    required String email,
    required String password,
  }) async {
    try {
      var url = '/user/login';
      final response = await network.post(
        url: url, 
        data: {
          "emailOrUsername": email,
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