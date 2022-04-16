import 'package:bias_user/app/models/user.dart';
import 'package:bias_user/app/routes/app_pages.dart';
import 'package:bias_user/services/local_storage_service.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  final localStorage = LocalStorageService.to;

  AuthService() {
    init();
  }

  init() async {
    final username = await localStorage.username;
    final token = await localStorage.token;
    final user = await localStorage.user;
    this.username = Rx<String?>(username);
    this.token = Rx<String?>(token);
    this.user = Rx<User?>(user);
    isLoggedIn.value = token != null;
  }

  var isLoggedIn = false.obs;
  late Rx<String?> username;
  late Rx<String?> token;
  late Rx<User?> user;

  void setUsername(String? data) async {
    await LocalStorageService.to.setUsername(data);
    username = Rx<String?>(data);
  }

  void setToken(String? data) async {
    await LocalStorageService.to.setToken(data);
    token = Rx<String?>(data);
  }

  void setUser(User? data) async {
    await LocalStorageService.to.setUser(data);
    user = Rx<User?>(data);
  }

  void logout() async {
    localStorage.setToken(null);
    localStorage.setUser(null);
    Get.offAndToNamed(Routes.login);
  }
}
