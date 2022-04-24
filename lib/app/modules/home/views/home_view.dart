import 'package:bias_user/app/modules/home/controllers/home_controller.dart';
import 'package:bias_user/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:bias_user/app/routes/app_pages.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:bias_user/helpers/general.dart';
import 'package:bias_user/helpers/date_helper.dart';
import 'package:bias_user/helpers/string_extension.dart';
import 'package:nx_flutter_ui_starter_pack/nx_flutter_ui_starter_pack.dart';
import 'package:bias_user/resources/colors.dart';
import 'package:get/get.dart';
class HomeView extends GetView<HomeController> {
  const HomeView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.init();
    return Scaffold(
      appBar: AppBar(
        title: Text('Bias Voucher'),
        actions: [
          Row(
            children: [
              IconButton(
                icon : Icon(Icons.assignment_ind_sharp),
                color: AppColors.primary,
                onPressed: () { Get.toNamed(Routes.userUpdate);},
              ),
              IconButton(
                icon : Icon(Icons.key),
                color: AppColors.primary,
                onPressed: () { Get.toNamed(Routes.userUpdatePassword);},
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: IconButton(
                  icon : Icon(Icons.logout),
                  color: AppColors.primary,
                  onPressed: () { AuthService.to.logout();},
                )
              ),
            ],
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: controller.onRefresh,
        child: ListView(
          children: [
            NxBox(
              margin: EdgeInsets.only(left: 20.0, right: 20.0, top : 10.0),
              color: Colors.transparent,
              borderRadius: 8,
              child: Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                NxText(
                  'Selamat Datang ${controller.user.value?.fullName?.toTitleCase() ?? ""}',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  lineHeight: 1.5,
                )]
              ))
            ),
            NxBox(
              borderColor: AppColors.primary,
              color: AppColors.primary,
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(16),
              borderRadius: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NxText(
                    'Balance', 
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  SizedBox(height: 6),
                  SizedBox(height: 6),
                  Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      NxText(
                        rupiah(controller.user.value?.balance ?? 0),
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ],
                  )),
                ],
              ),
            ),
            NxBox(
              margin: EdgeInsets.only(left: 16, right: 20.0, top : 0),
              borderRadius: 8,
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                NxText(
                  'Riwayat Pembayaran',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  lineHeight: 1.5,
                )]
              )
            ),
            Obx(()  =>  ListView.separated(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: controller.dataList.value.length,
              separatorBuilder: (contextn, index) => Divider(height: 0), 
              itemBuilder: (contextn, index) => Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.store, 
                                size: 20, 
                                color: Colors.red
                              ),
                              SizedBox(width: 4),
                              NxText(
                                controller.dataList.value[index].merchant?.name ?? '-',
                                color: Colors.black,
                                fontSize: 16,
                                lineHeight: 1.5,
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          NxText(
                            '${controller.dataList.value[index].note!="" ? controller.dataList.value[index].note : "Tidak Ada Catatan"}',
                            color: controller.dataList.value[index].note!="" ? Colors.green : Colors.grey,
                            fontSize: 12,
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.article, 
                                size: 12, 
                                color: Colors.grey
                              ),
                              SizedBox(width: 4),
                              NxText.small1(
                                controller.dataList.value[index].transactionCode ?? '-',
                                color: Colors.grey
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        NxText.lead1(
                          rupiah(controller.dataList.value[index].totalBuy),
                          color: Colors.green,
                        ),
                        SizedBox(width: 4),
                        NxText.small1(
                          DateHelper(date: controller.dataList.value[index].createdAt).format7() ?? '',
                          color: Colors.grey
                        ),
                      ],
                    ),
                  ],
                ),
              ), 
            )),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: NxButton.primary(
          onPressed: () => Get.toNamed(Routes.merchant),
          child: NxText('Bayar', color: Colors.white),
        ),
      ),
    );
  }
}