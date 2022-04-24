import 'package:bias_user/app/models/user.dart';
import 'package:bias_user/app/modules/auth/repositories/auth_repository.dart';
import 'package:bias_user/app/modules/home/repositories/home_repository.dart';
import 'package:bias_user/app/routes/app_pages.dart';
import 'package:bias_user/helpers/dialog_helper.dart';
import 'package:bias_user/helpers/network/network_exceptions.dart';
import 'package:bias_user/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();


  final _userRepository = AuthRepository();
  final _homeRepository = HomeRepository();
  final user = AuthService.to.user;

  @override
  void onInit() async {
    await loadUser();
    super.onInit();
  }
  // ----------------------------------------------------
  // UPDATE PASSWORD USER
  // ----------------------------------------------------

  var passwordController = TextEditingController();
  var oldPasswordController = TextEditingController();
  var confirmationPasswordController = TextEditingController();
  var password = Rx<String?>(null);
  var oldPassword = Rx<String?>(null);
  var confirmationPassword = Rx<String?>(null);
  var updatingPassword = false.obs;
  var passwordError = Rx<String>('');
  bool get isUpdatePasswordValid {
    var valid = true;

    if((password.value ?? '') == '') valid = false;

    if((oldPassword.value ?? '') == '') valid = false;

    if((confirmationPassword.value != password.value)) {
      passwordError.value = "Password baru tidak sama";
      valid = false;
    }

    return valid;
  }

  Future loadUser() async {
    try {
      user.value = await _homeRepository.getProfile();
    } catch (e) {
      print('error: $e');
    }
  }

  void updatePassword() async {
    try {
      updatingPassword.value = true;
      await _userRepository.updatePassword(
        password: password.value!,
        oldPassword: oldPassword.value!
      );
      updatingPassword.value = false;
      passwordController.text = "";
      confirmationPasswordController.text = "";
      oldPasswordController.text = "";
      await DialogHelper.showDialogSuccess(
        title: 'Berhasil',
        description: 'Password berhasil diubah'
      );
    } catch (e) {
      updatingPassword.value = false;
      print(e);
      DialogHelper.showDialogError(
        title: 'Terjadi Kesalahan',
        description: NetworkException.getErrorException(e).prefix
      );
    }
  }
  
  // ----------------------------------------------------
  // UPDATE USER
  // ----------------------------------------------------

  var fullNameController = TextEditingController();
  var fullName = Rx<String>('');
  var fullNameError = Rx<String>('');
  var divisionController = TextEditingController();
  var division = Rx<String>('');
  var divisionError = Rx<String>('');
  var phoneNumberController = TextEditingController();
  var phoneNumber = Rx<String>('');
  var phoneNumberError = Rx<String>('');
  var usernameController = TextEditingController();
  var username = Rx<String>('');
  var usernameError = Rx<String>('');
  var updatingUser = false.obs;

  void initUpdateUserForm() {
    fullNameController.text = user.value?.fullName ?? '';
    fullName.value = user.value?.fullName ?? '';
    divisionController.text = user.value?.division ?? '';
    division.value = user.value?.division ?? '';
    phoneNumberController.text = user.value?.phoneNumber ?? '';
    phoneNumber.value = user.value?.phoneNumber ?? '';
    usernameController.text = user.value?.userName?? '';
    username.value = user.value?.userName?? '';
  }

  bool get isUpdateUserValid {
    var valid = true;

    if(fullName.value == '') {
      fullNameError.value = 'Nama lengkap harus diisi';
      valid = false;
    }
    if(division.value == '') {
      divisionError.value = 'Divisi harus diisi';
      valid = false;
    }
    if(phoneNumber.value == '') {
      phoneNumberError.value = 'No hp harus diisi';
      valid = false;
    }
    if(username.value == '') {
      usernameError.value = 'Username harus diisi';
      valid = false;
    }

    return valid;
  }

  void updateUser() async {
    try {
      updatingUser.value = true;
      final response = await _userRepository.updateUser(
        fullName: fullName.value,
        division: division.value,
        phoneNumber: phoneNumber.value,
        username: username.value,
      );
      updatingUser.value = false;
      user.value = response;
      await DialogHelper.showDialogSuccess(
        title: 'Berhasil',
        description: 'Data user berhasil diubah'
      );
    } catch (e) {
      print(e);
      updatingUser.value = false;
      DialogHelper.showDialogError(
        title: 'Terjadi Kesalahan',
        description: NetworkException.getErrorException(e).prefix
      );
    }
  }

}
