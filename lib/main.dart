import 'package:bias_user/app/routes/app_pages.dart';
import 'package:bias_user/resources/colors.dart';
import 'package:bias_user/services/network_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'services/auth_service.dart';
import 'services/config_service.dart';
import 'services/local_storage_service.dart';

void main() async {
  
  await GetStorage.init();
  initializeDateFormatting();
  
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: AppColors.primary,
        errorColor: AppColors.error, 
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: AppColors.primary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: IconThemeData(
            color: AppColors.primary,
          ),
          elevation: 1,
        ),
        dividerTheme: DividerThemeData(
          thickness: 0,
          space: 0
        ),
        dividerColor: Colors.grey[400],
      ),
      title: "Bias Voucher",
      initialBinding: BindingsBuilder(
        () {
          Get.put(LocalStorageService());
          Get.put(AuthService());
          Get.put(ConfigService());
          Get.put(NetworkService());
        },
      ),
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
    ),
  );
}
