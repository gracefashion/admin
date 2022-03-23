import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/database/database.dart';

import '../data/models/enroll_data.dart';

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
    _subscription = FirebaseAuth.instance.userChanges().listen((user) {
      if (user == null) {
        currentUser.value.value = null;
      } else {
        currentUser.value.value = user;
        database.watchEnrollment(enrollCollection).listen((event) {
          debugPrint("**************${event.docs.length}");
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
