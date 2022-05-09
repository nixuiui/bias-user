import 'package:bias_user/app/modules/payment/controllers/payment_controller.dart';
import 'package:bias_user/resources/colors.dart';
import 'package:bias_user/services/config_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_flutter_ui_starter_pack/nx_flutter_ui_starter_pack.dart';
import 'package:flutter/services.dart';
class PaymentView extends StatelessWidget {
  const PaymentView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(PaymentController());
  
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
            appBar: AppBar(
          title: Text(
            'Pembayaran',
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 40.0, right: 40.0, top : 0.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NxText(
                          'Pembayaran Untuk :',
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          lineHeight: 1.5,
                        ),
                      ],
                    ),
                    SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NxText(
                          controller.params[1],
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                          lineHeight: 1.5,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    NxText.lead1(
                      'Total Belanja*',
                      color: Colors.black,
                    ),
                    SizedBox(height: 12),
                    Obx(() => NxTextFieldBox(
                      textHint: 'Masukan Total Belanja',
                      backgroundColor: Colors.white,
                      borderColor: AppColors.grey,
                      textColor: Colors.black,
                      borderRadius: 12,
                      inputType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),],
                      padding: 14,
                      prefix: Icon(Icons.price_check, color: Colors.green),
                      controller: controller.totalController,
                      textError: controller.totalError.value,
                    )),
                    SizedBox(height: 20),
                    NxText.lead1(
                      'Keterangan',
                      color: Colors.black,
                    ),
                    SizedBox(height: 12),
                    Obx(() => NxTextFieldBox(
                      textHint: 'Kamu Beli Apa Aja ?',
                      backgroundColor: Colors.white,
                      borderColor: Colors.grey,
                      textColor: Colors.black,
                      borderRadius: 12,
                      padding: 14,
                      prefix: Icon(Icons.article, color: Colors.black),
                      controller: controller.noteController,
                      textError: controller.noteError.value
                    )),
                    SizedBox(height: 28),
                  ],
                ),
              ),
              Obx(() => NxText(
                "${ConfigService.to.appVersion}",
                color: Colors.white,
              )),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          padding: EdgeInsets.all(16),
          child: Obx(() => NxButton(
            color: controller.loading.value ? Colors.white : AppColors.primary,
            borderColor: Colors.white,
            child: NxText(
              'Bayar Sekarang',
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            padding: 14,
            fontSize: 16,
            textColor: AppColors.primary,
            onPressed: controller.loading.value ? null : () => controller.payment(),
            isLoading: controller.loading.value,
          ),
        )),
      ),
    );
  }
}