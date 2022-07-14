import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/controller/main_controller.dart';
import 'package:kzn/providers/user_provider.dart';
import 'package:kzn/ui/routes/admin_login_route.dart';
import 'package:kzn/ui/routes/login_route.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    MainController _controller = Get.find();
    return Obx(() {
      return Container(
        child: _controller.currentUser.value.value == null
            ? Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pinkAccent,
                  ),
                  child: Text("Login", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.pushNamed(context, AdminLoginRoute.routeName);
                  },
                ),
              )
            : Column(
                children: [
                  Container(
                    child: new Image.asset(
                      'assets/images/appicon.png',
                      height: 70.0,
                    ),
                  ),
                  new Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                          "${_controller.currentUser.value.value?.phoneNumber}",
                      style: TextStyle(
                        color: Colors.pinkAccent
                      ),),
                    ),
                  ),
                ],
              ),
      );
    });
  }
}
