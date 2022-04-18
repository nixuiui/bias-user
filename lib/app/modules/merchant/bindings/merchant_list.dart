import 'package:get/get.dart';

import 'package:bias_user/app/modules/merchant/controllers/merchant_controller.dart';

class MerchantList extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MerchantController>(
      () => MerchantController(),
    );
  }
}
