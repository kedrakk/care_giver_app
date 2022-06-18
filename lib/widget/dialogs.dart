import 'package:care_giver/const/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showErrorMessage(String messsage) {
  Get.snackbar(
    "Failed",
    messsage,
    backgroundColor: AppTheme.quaternary,
    colorText: AppTheme.octonary,
  );
}

showSuccessMessage(String message) {
  Get.snackbar(
    "Success",
    message,
    backgroundColor: AppTheme.tertiary,
    colorText: AppTheme.octonary,
  );
}

showLoadingDialog() {
  Get.dialog(
    const Center(
      child: CircularProgressIndicator(),
    ),
    barrierDismissible: false,
  );
}

dismissDialog() {
  Get.back();
}
