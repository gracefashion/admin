import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kzn/controller/course_price_controller.dart';
import 'package:kzn/controller/main_controller.dart';

import '../../data/constant.dart';

class EditCourses extends StatefulWidget {
  static final routeName = "editcourse_route";
  const EditCourses({Key? key}) : super(key: key);

  @override
  State<EditCourses> createState() => _EditCoursesState();
}

class _EditCoursesState extends State<EditCourses> {
  @override
  void initState() {
    Get.put(CoursePriceController());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CoursePriceController _controller = Get.find();
    MainController _mainController = Get.find();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text("A 1 Courses Editing",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
                color: Colors.black)),
        actions: [
          IconButton(
            onPressed: () {
              _controller.pressCourseAddButton();
              Get.defaultDialog(
                title: "Add course and price",
                content: formWidget(
                  controller: _controller,
                  size: size,
                ),
                confirm: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    onPressed: () {
                      _controller.uploadCourse();
                    },
                    child: Text(
                      "Upload",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
            icon: Icon(FontAwesomeIcons.plusCircle, color: Colors.black),
          ),
        ],
      ),
      body: Obx(() => _mainController.coursePriceList.isNotEmpty
          ? ListView.separated(
              itemCount: _mainController.coursePriceList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title:
                      Text(_mainController.coursePriceList[index].courseName),
                  subtitle: Text(
                    "${_mainController.coursePriceList[index].coursePrice}",
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 5,
                  thickness: 1,
                );
              },
            )
          : const Center(
              child: Text(
                "No course yet!",
              ),
            )),
    );
  }

  Widget formWidget(
      {required CoursePriceController controller, required Size size}) {
    CoursePriceController _controller = Get.find();

    return Form(
      key: controller.formKey,
      child: SizedBox(
        height: size.height * 0.25,
        width: size.width * 0.8,
        child: SingleChildScrollView(
            child: Column(
          children: [
            //Course Name Form Firle
            TextFormField(
              controller: controller.courseNameController,
              validator: controller.validateCourseName,
              decoration: InputDecoration(
                hintText: "Ener course name",
                border: formBorder,
              ),
            ),
            //Space
            const SizedBox(height: 10),
            //Price Form Field
            TextFormField(
              controller: controller.priceController,
              validator: controller.validateCoursePrice,
              decoration: InputDecoration(
                hintText: "Ener course price",
                border: formBorder,
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        )),
      ),
    );
  }
}
