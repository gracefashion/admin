import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kzn/data/constant.dart';

import '../data/models/enroll_data.dart';
import '../services/database/database.dart';

class MainController extends GetxController {
  final Database database = Database(); //Dependencies Injection
  late StreamSubscription _subscription;

  var currentUser = Rxn<User?>().obs;
  RxList<EnrollData> enrollDataList = <EnrollData>[].obs;

  @override
  void onInit() {
    listenToUserChange();
    super.onInit();
  }

  Future<void> logOut() => FirebaseAuth.instance.signOut();

  void listenToUserChange() {
    _subscription = FirebaseAuth.instance.userChanges().listen((user) async {
      if (user == null) {
        currentUser.value.value = null;
      } else {
        currentUser.value.value = user;
        await FirebaseMessaging.instance.subscribeToTopic("enrollment");
        database.watchEnrollment(enrollCollection).listen((event) {
          if (event.docs.isEmpty) {
            enrollDataList.clear();
          } else {
            enrollDataList.value =
                event.docs.map((e) => EnrollData.fromJson(e.data())).toList();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
