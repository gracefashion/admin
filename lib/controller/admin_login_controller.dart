import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kzn/controller/main_controller.dart';

import '../utils/app/app_state.dart';
import '../utils/auth/auth_failure.dart';

class AdminLoginController extends GetxController {
  MainController _controller = Get.find();
  TextEditingController phoneController = TextEditingController();
  TextEditingController phoneCodeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  String? inputValidator(String? value) =>
      !(value == null) && value.isNotEmpty ? null : "Please fill required data";

  var authFailure = const AuthFailure.init().obs; //AuthFailure
  var isPhoneCodeSent = false.obs;
  var isPhoneSignInLoading = false.obs; // True when phone sms code start sent.

  @override
  void onInit() {
    ever(isPhoneSignInLoading, showOrPopDialog);
    super.onInit();
  }

  //Sign In With Phone Number
  Future<void> signInWithPhoneNumber(String phone,
      {required void Function(void Function(String code)) enterCode}) async {
    try {
      isPhoneSignInLoading.value = true;
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+95$phone",
        verificationCompleted: (PhoneAuthCredential credential) async {
          isPhoneSignInLoading.value = false;
          //Sign In With Credential
          try {
            await FirebaseAuth.instance.signInWithCredential(credential);
          } on FirebaseAuthException catch (e) {
            debugPrint("*************verification-complete****************");
            authFailure.value = const AuthFailure.credentialSignInError();
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          isPhoneSignInLoading.value = false;
          if (e.code == 'invalid-phone-number') {
            authFailure.value = const AuthFailure.invalidPhoneNumber();
            debugPrint("*************verification-failed****************");
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          isPhoneSignInLoading.value = false;
          isPhoneCodeSent.value = true;
          // Create a PhoneAuthCredential with the code when user enter phone code with
          //CallBack
          enterCode((phoneCode) {
            PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId: verificationId, smsCode: phoneCode);
            //Sign In With Credential...
            FirebaseAuth.instance.signInWithCredential(credential).then(
                  (value) => Get.back(),
                  onError: (onError) => debugPrint("Error login"),
                );
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          isPhoneSignInLoading.value = false;
          debugPrint(
              "*************Retrieve TimeOut ${verificationId}****************");
        },
      );
    } on FirebaseAuthException catch (e) {
      isPhoneSignInLoading.value = false;
      authFailure.value = const AuthFailure.verifyError();
    }
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
