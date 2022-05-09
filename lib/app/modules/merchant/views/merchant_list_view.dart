import 'package:bias_user/app/modules/merchant/controllers/merchant_controller.dart';
import 'package:flutter/material.dart';
import 'package:bias_user/app/routes/app_pages.dart';
import 'package:get/get.dart';
class MerchantListView extends GetView<MerchantController> {
  
  const MerchantListView({ 
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Silahkan Pilih Merchant',
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async => controller.onRefresh(),
        child: Obx(() {
          return Container(
            child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                    title: Text(
                      controller.dataList.value[index].name ?? "-", 
                      style: TextStyle(fontSize: 25)
                    ),
                    onTap : () => Get.toNamed(Routes.payment, arguments: [controller.dataList.value[index].id , controller.dataList.value[index].name ]),
                    subtitle: Text('Frekuensi Pembelian: ${controller.dataList.value[index].sold ?? "-"} kali'),
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text(
                        controller.dataList.value[index].name?[0] ?? "-", 
                        style: TextStyle(fontSize: 20)
                      ),
                    )
                ),
              );
            },
            itemCount: controller.dataList.value.length
            ),
          );
        }),
      ),
    );
  }

}