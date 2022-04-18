import 'package:bias_user/app/routes/app_pages.dart';
import 'package:get/get.dart';

import 'bindings/payment_binding.dart';
import 'views/payment_view.dart';

final paymentPages = [
  GetPage(
    name: Routes.payment,
    page: () => PaymentView(),
    binding: PaymentBinding(),
    participatesInRootNavigator: true,
    preventDuplicates: true,
  )
];