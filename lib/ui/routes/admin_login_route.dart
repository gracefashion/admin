import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/controller/admin_login_controller.dart';

import '../../data/constant.dart';
import '../pages/verify_phone_code.dart';

class AdminLoginRoute extends StatefulWidget {
  static final routeName = "/admin_login_route";
  const AdminLoginRoute({Key? key}) : super(key: key);

  @override
  State<AdminLoginRoute> createState() => _AdminLoginRouteState();
}

class _AdminLoginRouteState extends State<AdminLoginRoute> {
  @override
  void initState() {
    Get.put(AdminLoginController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AdminLoginController _controller = Get.find();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _controller.formKey,
          child: Column(
            children: [
              //A1 Image
              Center(
                child: Container(
                  //color: Colors.green,
                  width: size.width * 0.7,
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 120, bottom: 40),
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
              //Phone TextField
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  autofocus: true,
                  controller: _controller.phoneController,
                  validator: _controller.inputValidator,
                  decoration: InputDecoration(
                    hintText: "Enter phone number",
                    border: formBorder,
                    focusedBorder: formBorder,
                  ),
                ),
              ),
              //Space
              const SizedBox(
                height: 30,
              ),
              //Button
              Center(
                child: SizedBox(
                  width: 270,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(50, 50),
                      primary: Colors.pinkAccent,
                    ),
                    onPressed: () => _controller
                        .signInWithPhoneNumber(_controller.phoneController.text,
                            enterCode: (function) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            VerifyPhoneCodePage(callBack: function),
                      ));
                    }),
                    child: Text("OTP Code တောင်းခံမည်",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          wordSpacing: 2,
                          letterSpacing: 1,

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
