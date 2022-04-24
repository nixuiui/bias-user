import 'package:bias_user/app/routes/app_pages.dart';
import 'package:get/get.dart';

import 'bindings/auth_binding.dart';
import 'views/login_view.dart';
import 'views/user_update_view.dart';
import 'views/user_update_password_view.dart';

final authPages = [
  GetPage(
    name: Routes.login,
    page: () => LoginView(),
    binding: AuthBinding(),
    participatesInRootNavigator: true,
    preventDuplicates: true,
  ),
  GetPage(
    name: Routes.userUpdate,
    page: () => UserUpdateView(),
    participatesInRootNavigator: true,
    preventDuplicates: true,
  ),
  GetPage(
    name: Routes.userUpdatePassword,
    page: () => UserUpdatePasswordView(),
    participatesInRootNavigator: true,
    preventDuplicates: true,
  ),
];