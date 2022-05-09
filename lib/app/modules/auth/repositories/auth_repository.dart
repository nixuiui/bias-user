import 'dart:convert';

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
    } catch (e, _) {
      rethrow;
    }
  }

  Future<User?> updatePassword({
    required String password,
    required String oldPassword,
  }) async {
    try {
      var url = '/user/me/password';
      final response = await network.patch(
        url: url,
        data: {
          "password" : password,
          "oldPassword" : oldPassword
        }
      );
      return userFromJson(
        jsonEncode(response.data['data'])
      );
    } catch (e) {
      rethrow;
    }
  }
  
  Future<User?> updateUser({
    required String fullName,
    required String division,
    required String phoneNumber,
    required String username,
  }) async {
    try {
      var url = '/user/me';
      final response = await network.patch(
        url: url,
        data:  {
          "fullName": fullName,
          "division": division,
          "phoneNumber": phoneNumber,
          "userName": username
        }
      );
      return userFromJson(
        jsonEncode(response.data['data'])
      );
    } catch (e) {
      rethrow;
    }
  }

}