import 'package:bias_user/app/modules/register/repositories/register_repository.dart';
import 'package:bias_user/app/routes/app_pages.dart';
import 'package:bias_user/helpers/dialog_helper.dart';
import 'package:bias_user/helpers/network/network_exceptions.dart';
import 'package:bias_user/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get to => Get.find();

  final registerRepository = RegisterRepository();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final divisionController = TextEditingController();
  final nameController = TextEditingController();
  
  final nameError = ''.obs;
  final phoneNumberError = ''.obs;
  final usernameError = ''.obs;
  final passwordError = ''.obs;
  final divisionError = ''.obs;


  final loading = false.obs;

  RegisterController() {
    debugPrint('RegisterController:: RegisterController()');
    usernameController.text = AuthService.to.username.value ?? '';
  }

  bool isValid() {
    var isValid = true;
    usernameError.value = '';
    passwordError.value = '';
    phoneNumberError.value = '';
    nameError.value = '';

    if(usernameController.text == '') {
      isValid = false;
      usernameError.value = 'Username harus diisi';
    }
    
    if(passwordController.text == '') {
      isValid = false;
      passwordError.value = 'Password harus diisi';
    }

    if(phoneNumberController.text == '') {
      isValid = false;
      phoneNumberError.value = 'Nomor Telepon harus diisi';
    }

    if(nameController.text == '') {
      isValid = false;
      nameError.value = 'Nama Lengkap harus diisi';
    }

    return isValid;
  }

  void register() async {
    if(isValid()) {
      try {
        loading.value = true;
        final response = await registerRepository.login(
          fullName: nameController.text, 
          division: divisionController.text,
          phoneNumber: phoneNumberController.text, 
          userName: usernameController.text, 
          password: passwordController.text, 
        );
        AuthService.to.setUsername(usernameController.text);
        AuthService.to.setToken(response?.token);
        AuthService.to.setUser(response);
        Get.offNamed(Routes.home);
      } catch (e) {
        loading.value = false;
        print('erroe: $e');
        DialogHelper.showDialogError(
          title: 'Terjadi Kesalahan',
          description: NetworkException.getErrorException(e).prefix,
        );
      } 
    }
  }

}
