import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/data/models/enroll_data.dart';
import 'package:uuid/uuid.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> requestCoursePrice(
      String collectionPath) {
    return _firestore
        .collection(collectionPath)
        .orderBy("dateTime", descending: true)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> watchEnrollment(
          String collectionPath) =>
      _firestore
          .collection(collectionPath)
          .orderBy('dateTime', descending: true)
          .snapshots();

  Future<bool> uploadSimplData(
      Map<String, dynamic> json, String collectionPath) async {
    Completer<bool> completer = Completer();
    try {
      await _firestore
          .collection(collectionPath)
          .doc()
          .set(json)
          .then((value) => completer.complete(true));
    } catch (e) {
      completer.complete(false);
      debugPrint("******Simple Data Upload Error: $e");
    }
    return completer.future;
  }

  Future<bool> uploadEnrollData(EnrollData enrollData) async {
    Completer<bool> _completer = Completer();
    if (enrollData.bankSsImage.isNotEmpty &&
        enrollData.facebookProfileSsImage.isNotEmpty) {
      List<File> _fileList = <File>[
        File(enrollData.bankSsImage),
        File(enrollData.facebookProfileSsImage),
      ];
      try {
        EnrollData jsonData = enrollData;
        Future.wait(List.generate(_fileList.length, (index) async {
          await _storage
              .ref()
              .child("enrollSs/${Uuid().v1()}")
              .putFile(_fileList[index])
              .then((snapshot) async {
            debugPrint(
                '*********************Uploaded ${snapshot.bytesTransferred} bytes.');
            await snapshot.ref.getDownloadURL().then((value) => index == 0
                ? jsonData = jsonData.copyWith(
                    bankSsImage: value,
                  )
                : jsonData = jsonData.copyWith(facebookProfileSsImage: value));
          });
        })).then((value) async {
          jsonData = jsonData.copyWith(dateTime: DateTime.now());
          await _firestore
              .collection(enrollCollection)
              .doc()
              .set(jsonData.toJson())
              .then((value) => _completer.complete(true));
        });
      } catch (e) {
        _completer.complete(false);
        debugPrint("*************Something wrong $e**************");
      }
    }
    return _completer.future;
  }
}
