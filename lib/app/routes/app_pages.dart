import 'package:bias_user/app/modules/auth/auth_pages.dart';
import 'package:bias_user/app/modules/home/home_pages.dart';
import 'package:bias_user/app/modules/splash/splash_pages.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    ...splashPages,
    ...authPages,
    ...homePages,
  ];
}