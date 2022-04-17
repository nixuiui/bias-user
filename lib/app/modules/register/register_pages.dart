import 'package:bias_user/app/routes/app_pages.dart';
import 'package:get/get.dart';

import 'bindings/regsiter_binding.dart';
import 'views/register_view.dart';

final registerPages = [
  GetPage(
    name: Routes.register,
    page: () => RegisterView(),
    binding: RegisterBinding(),
    participatesInRootNavigator: true,
    preventDuplicates: true,
  )
];