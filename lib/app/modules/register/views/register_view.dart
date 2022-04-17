import 'package:bias_user/app/modules/register/controllers/register_controller.dart';
import 'package:bias_user/resources/colors.dart';
import 'package:bias_user/app/routes/app_pages.dart';
import 'package:bias_user/services/config_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_flutter_ui_starter_pack/nx_flutter_ui_starter_pack.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(RegisterController());

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
                    NxText(
                      'Daftar',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      lineHeight: 1.5,
                    ),
                    SizedBox(height: 8),
                    NxText(
                      'Silahkan Isi Formulir Dibawah Untuk Membuat Akun',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 194, 19, 19),
                      lineHeight: 1.5,
                    ),
                    SizedBox(height: 15),
                    /*Image.asset(
                      'assets/pngs/logo.png',
                      width: 600.0,
                      height: 240.0,
                      fit: BoxFit.cover,
                    ),*/ 
                    NxText.lead1(
                      'Nama Lengkap',
                      color: Colors.black,
                    ),
                    SizedBox(height: 7),
                    Obx(() => NxTextFieldBox(
                      textHint: 'Masukan Nama Lengkap Kamu',
                      backgroundColor: AppColors.bgInputBlack,
                      borderColor: AppColors.bgInputBlack,
                      textColor: Colors.white,
                      borderRadius: 12,
                      padding: 10,
                      prefix: Icon(Icons.person, color: Colors.white),
                      controller: controller.nameController,
                      textError: controller.nameError.value,
                    )),
                    SizedBox(height: 0),
                    NxText.lead1(
                      'Nomor Handphone',
                      color: Colors.black,
                    ),
                    SizedBox(height: 7),
                    Obx(() => NxTextFieldBox(
                      textHint: 'Masukan Nomor Handphone Kamu',
                      backgroundColor: AppColors.bgInputBlack,
                      borderColor: AppColors.bgInputBlack,
                      textColor: Colors.white,
                      borderRadius: 12,
                      padding: 10,
                      prefix: Icon(Icons.phone_android, color: Colors.white),
                      controller: controller.phoneNumberController,
                      textError: controller.phoneNumberError.value,
                    )),
                    SizedBox(height: 0),
                    NxText.lead1(
                      'Divisi',
                      color: Colors.black,
                    ),
                    SizedBox(height: 7),
                    Obx(() => NxTextFieldBox(
                      textHint: 'Divisi Kamu Di Bias School',
                      backgroundColor: AppColors.bgInputBlack,
                      borderColor: AppColors.bgInputBlack,
                      textColor: Colors.white,
                      borderRadius: 12,
                      padding: 10,
                      prefix: Icon(Icons.group, color: Colors.white),
                      controller: controller.divisionController,
                      textError: controller.divisionError.value,
                    )),
                    SizedBox(height: 0),
                    NxText.lead1(
                      'Username',
                      color: Colors.black,
                    ),
                    SizedBox(height: 7),
                    Obx(() => NxTextFieldBox(
                      textHint: 'Username untuk login',
                      backgroundColor: AppColors.bgInputBlack,
                      borderColor: AppColors.bgInputBlack,
                      textColor: Colors.white,
                      borderRadius: 12,
                      padding: 10,
                      prefix: Icon(Icons.verified_user, color: Colors.white),
                      controller: controller.usernameController,
                      textError: controller.usernameError.value,
                    )),
                    SizedBox(height: 0),
                    NxText.lead1(
                      'Password',
                      color: Colors.black,
                    ),
                    SizedBox(height: 7),
                    Obx(() => NxTextFieldBox(
                      textHint: 'Masukan Password',
                      backgroundColor: AppColors.bgInputBlack,
                      borderColor: AppColors.bgInputBlack,
                      textColor: Colors.white,
                      borderRadius: 12,
                      padding: 10,
                      prefix: Icon(Icons.lock, color: Colors.white),
                      controller: controller.passwordController,
                      textError: controller.passwordError.value,
                      isObsecure: true,
                    )),
                    SizedBox(height: 20),
                    Obx(() => NxButton(
                      color: AppColors.primary,
                      borderColor: Colors.white,
                      child: NxText(
                        'Daftar Sekarang',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      padding: 14,
                      fontSize: 16,
                      textColor: AppColors.primary,
                      onPressed: controller.loading.value ? null : () => controller.register(),
                      isLoading: controller.loading.value,
                    )),
                    SizedBox(height: 10),
                    Obx(() => NxButton(
                      color:  Colors.blue,
                      child: NxText(
                        'Login',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      padding: 14,
                      fontSize: 16,
                      textColor: AppColors.primary,
                      onPressed: controller.loading.value ? null : () => Get.offAllNamed(Routes.login),
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