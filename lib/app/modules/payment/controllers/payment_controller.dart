import 'package:bias_user/app/modules/payment/repositories/payment_repository.dart';
import 'package:bias_user/app/routes/app_pages.dart';
import 'package:bias_user/helpers/dialog_helper.dart';
import 'package:bias_user/helpers/network/network_exceptions.dart';
import 'package:bias_user/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  static PaymentController get to => Get.find();
  final params = Get.arguments;
  final paymentRepository = PaymentRepository();

  final totalController = TextEditingController();
  final noteController = TextEditingController();
  
  final totalError = ''.obs;
  final noteError = ''.obs;

  final loading = false.obs;

  PaymentController() {
    debugPrint('PaymentController:: PaymentController()');
  }

  bool isValid() {
    var isValid = true;
    totalError.value = '';
    noteError.value = '';

    if(totalController.text == '' || totalController.text == '0') {
      isValid = false;
      totalError.value = 'Total harus diisi';
    }
    
    return isValid;
  }

  void payment() async {
    if(isValid()) {
      try {
        loading.value = true;
        final response = await paymentRepository.pay(
          totalBuy:  int.parse(totalController.text), 
          note: noteController.text, 
          merchant : params[0]
        );
        totalController.text = "";
        noteController.text = "";
        DialogHelper.showDialogSuccess(
          title: 'Transaksi Berhasil',
          description: "Terima Kasih Sudah Berbelanja Di ${params[1]}",
        );
        loading.value = false;
      } catch (e) {
        loading.value = false;
        print(e);
        DialogHelper.showDialogError(
          title: 'Terjadi Kesalahan',
          description: NetworkException.getErrorException(e).prefix,
        );
      } 
    }
  }

}
