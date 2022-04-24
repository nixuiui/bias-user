import 'package:bias_user/app/modules/auth/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_flutter_ui_starter_pack/nx_flutter_ui_starter_pack.dart';

class UserUpdateView extends StatefulWidget {
  
  const UserUpdateView({ 
    Key? key,
  }) : super(key: key);

  @override
  State<UserUpdateView> createState() => _UserUpdateViewState();
}

class _UserUpdateViewState extends State<UserUpdateView> {

  final controller = UserController();

  @override
  void initState() {
    controller.onInit();
    controller.initUpdateUserForm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Ubah Profile User',
          )
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NxText.lead2("Nama Lengkap"),
                      SizedBox(height: 8),
                      Obx(() => NxTextFieldBox(
                        textHint: 'Masukkan nama lengkap',
                        controller: controller.fullNameController,
                        textColor: Colors.black,
                        padding: 12,
                        onChanged: (val) => controller.fullName.value = val,
                        textError: controller.fullNameError.value,
                      )),
                      SizedBox(height: 16),
                      NxText.lead2("Divisi"),
                      SizedBox(height: 8),
                      NxTextFieldBox(
                        textHint: 'Masukkan nama divisi',
                        controller: controller.divisionController,
                        padding: 12,
                        onChanged: (val) => controller.division.value = val,
                        textError: controller.divisionError.value,
                      ),
                      SizedBox(height: 16),
                      NxText.lead2("No HP"),
                      SizedBox(height: 8),
                      NxTextFieldBox(
                        textHint: '08xxx',
                        controller: controller.phoneNumberController,
                        inputType: TextInputType.phone,
                        padding: 12,
                        onChanged: (val) => controller.phoneNumber.value = val,
                        textError: controller.phoneNumberError.value,
                      ),
                      SizedBox(height: 16),
                      NxText.lead2("Username"),
                      SizedBox(height: 8),
                      NxTextFieldBox(
                        textHint: 'Masukkan username',
                        controller: controller.usernameController,
                        padding: 12,
                        onChanged: (val) => controller.username.value = val,
                        textError: controller.usernameError.value,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Obx(() => NxButton.primary(
                onPressed: controller.isUpdateUserValid ? () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  controller.updateUser();
                } : null,
                isLoading: controller.updatingUser.value,
                child: NxText(
                  'Simpan',
                  color: Colors.white,
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
  
}