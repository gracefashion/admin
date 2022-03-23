import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/controller/main_controller.dart';
import 'package:kzn/ui/routes/admin_login_route.dart';

MainController _mainController = Get.find();

void checkAdmin(Page page) {
  if (_mainController.currentUser.value == null) {
    Get.off(AdminLoginRoute());
  } else {
    Get.to(page);
  }
}
