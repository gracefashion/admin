import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/controller/admin_login_controller.dart';

import '../../data/constant.dart';

class VerifyPhoneCodePage extends StatelessWidget {
  final void Function(String) callBack;
  const VerifyPhoneCodePage({Key? key, required this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdminLoginController _controller = Get.find();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Form(
          //key: _controller.formKey,
          child: ListView(
            children: [
              //A1 Image
              Center(
                child: Container(
                  //color: Colors.green,
                  width: size.width * 0.6,
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 40),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: AssetImage('assets/images/appicon.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              ),
              //Notification Sentence
              Padding(
                padding: const EdgeInsets.only(left: 50,right: 50,top: 10),
                child: const Text(
                    "We have sent 6 digits verification code into your phone\n"
                    "Check code and enter...",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ),
              const SizedBox(height: 15),
              //Phone TextField
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  autofocus: true,
                  controller: _controller.phoneCodeController,
                  validator: _controller.inputValidator,
                  decoration: InputDecoration(
                    hintText: "Enter 6 digits code",
                    border: formBorder,
                    focusedBorder: formBorder,
                  ),
                ),
              ),
              //Space
              const SizedBox(
                height: 10,
              ),
              //Button
              Center(
                child: SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(50, 50),
                      primary: Colors.black,
                    ),
                    onPressed: () =>
                        callBack(_controller.phoneCodeController.text),
                    child: Text("Verify",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
