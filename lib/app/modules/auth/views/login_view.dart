import 'package:bias_user/app/modules/auth/controllers/auth_controller.dart';
import 'package:bias_user/resources/colors.dart';
import 'package:bias_user/app/routes/app_pages.dart';
import 'package:bias_user/services/config_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_flutter_ui_starter_pack/nx_flutter_ui_starter_pack.dart';

class LoginView extends StatelessWidget {
  const LoginView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(AuthController());

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(40),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/pngs/logo.png',
                          width: 150.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NxText(
                          'Login',
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          lineHeight: 1.5,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NxText(
                          'Silahkan Masuk Dengan Akun Bias Kamu',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          lineHeight: 1.5,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    NxText.lead1(
                      'Username',
                      color: Colors.black,
                    ),
                    SizedBox(height: 12),
                    Obx(() => NxTextFieldBox(
                      textHint: 'Masukan Username',
                      backgroundColor: AppColors.bgInputBlack,
                      borderColor: AppColors.bgInputBlack,
                      textColor: Colors.white,
                      borderRadius: 12,
                      padding: 14,
                      prefix: Icon(Icons.email, color: Colors.white),
                      controller: controller.emailController,
                      textError: controller.emailError.value,
                    )),
                    SizedBox(height: 20),
                    NxText.lead1(
                      'Password',
                      color: Colors.black,
                    ),
                    SizedBox(height: 12),
                    Obx(() => NxTextFieldBox(
                      textHint: 'Masukan Password',
                      backgroundColor: AppColors.bgInputBlack,
                      borderColor: AppColors.bgInputBlack,
                      textColor: Colors.white,
                      borderRadius: 12,
                      padding: 14,
                      prefix: Icon(Icons.lock, color: Colors.white),
                      controller: controller.passwordController,
                      textError: controller.passwordError.value,
                      isObsecure: true,
                    )),
                    SizedBox(height: 28),
                    Obx(() => NxButton(
                      color: AppColors.primary,
                      borderColor: Colors.white,
                      child: NxText(
                        'Login',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      padding: 14,
                      fontSize: 16,
                      textColor: AppColors.primary,
                      onPressed: controller.loading.value ? null : () => controller.login(),
                      isLoading: controller.loading.value,
                    )),
                    SizedBox(height: 10),
                    Obx(() => NxButton(
                      color:  Colors.blue,
                      child: NxText(
                        'Daftar',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      padding: 14,
                      fontSize: 16,
                      textColor: AppColors.primary,
                      onPressed: controller.loading.value ? null : () => Get.toNamed(Routes.register),
                      isLoading: controller.loading.value,
                    )),
                    SizedBox(height: 24),
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
      ),
    );
  }
}