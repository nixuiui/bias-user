import 'package:bias_user/app/routes/app_pages.dart';
import 'package:get/get.dart';

import 'bindings/merchant_list.dart';
import 'views/merchant_list_view.dart';

final merchantPages = [
  GetPage(
    name: Routes.merchant,
    page: () => MerchantListView(),
    binding: MerchantList(),
    participatesInRootNavigator: true,
    preventDuplicates: true,
  )
];