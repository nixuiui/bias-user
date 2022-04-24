import 'package:bias_user/app/modules/auth/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_flutter_ui_starter_pack/nx_flutter_ui_starter_pack.dart';

class UserUpdatePasswordView extends StatefulWidget {
  
  const UserUpdatePasswordView({ 
    Key? key,
  }) : super(key: key);

  @override
  State<UserUpdatePasswordView> createState() => _UserUpdatePasswordViewState();
}

class _UserUpdatePasswordViewState extends State<UserUpdatePasswordView> {

  final controller = UserController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Ubah Password',
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
                      NxText.body2('Password Lama'),
                      SizedBox(height: 8),
                      NxTextFieldBox(
                        textHint: 'Isi password lama',
                        inputType: TextInputType.visiblePassword,
                        isObsecure: true,
                        controller: controller.oldPasswordController,
                        padding: 12,
                        onChanged: (val) => controller.oldPassword.value = val,
                      ),
                      SizedBox(height: 8),
                      NxText.body2('Password Baru'),
                      SizedBox(height: 8),
                      NxTextFieldBox(
                        textHint: 'Isi password baru',
                        inputType: TextInputType.visiblePassword,
                        isObsecure: true,
                        controller: controller.passwordController,
                        padding: 12,
                        onChanged: (val) => controller.password.value = val,
                      ),
                      SizedBox(height: 8),
                      NxText.body2('Konfirmasi Password baru'),
                      SizedBox(height: 8),
                      NxTextFieldBox(
                        textHint: 'Isi konfirmasi password baru',
                        inputType: TextInputType.visiblePassword,
                        isObsecure: true,
                        controller: controller.confirmationPasswordController,
                        padding: 12,
                        onChanged: (val) => controller.confirmationPassword.value = val,
                        textError: controller.passwordError.value,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Obx(() => NxButton.primary(
                onPressed: controller.isUpdatePasswordValid ? () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  controller.updatePassword();
                } : null,
                isLoading: controller.updatingPassword.value,
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