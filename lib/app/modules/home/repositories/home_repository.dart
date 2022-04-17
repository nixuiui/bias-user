import 'package:bias_user/app/models/user.dart';
import 'package:bias_user/services/network_service.dart';

class HomeRepository {

  var network = NetworkService.to;

  Future<User?> getProfile() async {
    try {
      var url = '/user/me';
      final response = await network.get(
        url: url
      );
      return User.fromJson(response.data['data']);
    } catch (e) {
      rethrow;
    }
  }

}