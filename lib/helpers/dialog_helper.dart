import 'package:bias_user/app/widgets/dialogs/dialog.dart';
import 'package:get/get.dart';


class DialogHelper {

  static showDialogError({
    String? title, String? description
  }) {
    Get.dialog(
      DialogAlert.error(
        title: title,
        description: description,
      ),
    );
  }

  static showDialogSuccess({
    String? title, String? description
  }) {
    Get.dialog(
      DialogAlert.success(
        title: title,
        description: description,
      ),
    );
  }

}