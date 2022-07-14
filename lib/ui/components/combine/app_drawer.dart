import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/controller/main_controller.dart';
import 'package:kzn/ui/components/single/user_info.dart';
import 'package:kzn/ui/routes/about_route.dart';
import 'package:kzn/ui/routes/edit_courses.dart';
import 'package:kzn/ui/routes/enrollment_route.dart';
import 'package:kzn/ui/routes/privacy-policy.dart';
import 'package:kzn/ui/routes/tnc_route.dart';

import '../../../data/constant.dart';
import '../../../utils/open_facebook.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MainController _controller = Get.find();
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white38,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(appName,style: TextStyle(color: Colors.white,fontSize: 36),),
                UserInfo()
              ],
            ),
          ),
          Obx(() {
            return _controller.currentUser.value.value != null
                ? ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.pinkAccent,
                        minRadius: 15,
                        maxRadius: 15,
                        child: Text(
                          "${_controller.enrollDataList.length}",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )),
                    title: Text("My Enrollment Data 📜",
                        style: TextStyle(color: Colors.pinkAccent)),
                    onTap: () {
                      Navigator.pushNamed(context, EnrollmentRoute.routeName);
                    },
                  )
                : const SizedBox();
          }),
          //Edit Course
          Obx(() {
            return _controller.currentUser.value.value != null
                ? ListTile(
                    leading: Icon(
                      Icons.edit,
                      color: Colors.pinkAccent,
                    ),
                    title: Text("Edit Courses Price 💸",
                        style: TextStyle(color: Colors.pinkAccent)),
                    onTap: () {
                      Navigator.pushNamed(context, EditCourses.routeName);
                    },
                  )
                : const SizedBox();
          }),
          Container(
            margin: EdgeInsets.all(5),
            child: ListTile(
              leading: Icon(
                Icons.privacy_tip,
                color: Colors.pinkAccent,
              ),
              title:
                  Text('Privacy Policy', style: TextStyle(color: Colors.pinkAccent)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.pushNamed(context, PrivacyPolicyRoute.routeName);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: ListTile(
              leading: Icon(Icons.book, color: Colors.pinkAccent),
              title: Text('Terms of Conditions',
                  style: TextStyle(color: Colors.pinkAccent)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.pushNamed(context, TnCRoute.routeName);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: ListTile(
              leading: Icon(Icons.group, color: Colors.pinkAccent),
              title: Text(
                'About',
                style: TextStyle(color: Colors.pinkAccent),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.pushNamed(context, AboutRoute.routeName);
              },
            ),
          ),

          Divider(),
          Obx(() {
            return _controller.currentUser.value.value != null
                ? Container(
                    margin: EdgeInsets.only(top: 5, left: 8, right: 8),
                    child: ListTile(
                      leading: Icon(Icons.logout, color: Colors.pinkAccent),
                      title:
                          Text('Logout', style: TextStyle(color: Colors.pinkAccent)),
                      onTap: () {
                        _controller.logOut();
                        // Then close the drawer
                        // Navigator.pop(context);
                        //Navigator.pushReplacementNamed(context, LoginRoute.routeName);
                      },
                    ),
                  )
                : const SizedBox();
          })
        ],
      ),
    );
  }
}
