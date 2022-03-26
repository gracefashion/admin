import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/controller/main_controller.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/data/models/course_price.dart';
import 'package:uuid/uuid.dart';

class CoursePriceController extends GetxController {
  MainController _controller = Get.find();
  TextEditingController courseNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  var isUploading = false.obs;

  @override
  void onInit() async {
    ever(isUploading, showOrPopDialog);
    super.onInit();
  }

  Future<void> uploadCourse() async {
    if (formKey.currentState?.validate() == true) {
      isUploading.value = true;
      final coursePrice = CoursePrice(
        id: Uuid().v1(),
        courseName: courseNameController.text,
        coursePrice: int.tryParse(priceController.text)!,
        dateTime: DateTime.now(),
      );
      _controller.database
          .uploadSimplData(
        coursePrice.toJson(),
        courseCollection,
      )
          .then((value) {
        if (value) {
          //Need to pop form dialog
          Get.back();
          //If Success
          isUploading.value = false;
          Get.snackbar("Course Uploading", "Success");
        } else {
          isUploading.value = false;
          Get.snackbar("Course Uploading", "Failed");
        }
      });
    }
  }

  String? validateCourseName(String? value) {
    if (value == null || value.isEmpty) {
      return "please,fill course name";
    } else {
      return null;
    }
  }

  String? validateCoursePrice(String? value) {
    if (value == null || value.isEmpty) {
      return "please,fill course price";
    } else if (int.tryParse(value)! <= 0) {
      return "price must be greater than 0 ks";
    } else {
      return null;
    }
  }

  void pressCourseAddButton() {
    formKey = GlobalKey();
    courseNameController.text.isNotEmpty
        ? courseNameController.text = ""
        : null;
    priceController.text.isNotEmpty ? priceController.text = "" : null;
  }

  showOrPopDialog(bool value) {
    if (value) {
      Get.dialog(
        const SizedBox(
          height: 50,
          width: 50,
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.black,
              strokeWidth: 6,
            ),
          ),
        ),
        barrierDismissible: false,
        barrierColor: Colors.grey.withOpacity(0),
      );
    } else {
      Get.back();
      //No thing do
    }
  }
}
