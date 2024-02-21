import 'package:getxmvvm/res/colors/app_colors.dart';
import 'package:getxmvvm/res/size/size.dart';
import 'package:getxmvvm/res/text/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmvvm/res/components/round_button.dart';
import 'package:getxmvvm/utils/utils.dart';
import 'package:getxmvvm/view_models/controller/login/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// CircleAvatar(
//               radius: 80.0,
//               backgroundImage: addmemberVM.imageUrl.isNotEmpty ? FileImage(
//                 File(addmemberVM.imageUrl.toString()),
//               ) : null,
//             ),

class _LoginScreenState extends State<LoginScreen> {
  final loginVM = Get.put(LoginViewModel());
  final loginkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: loginkey,
              child: Column(
                children: [
                  boldtText("Welcome Back", 0.1, AppColor.appcolor, context),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: loginVM.emailController.value,
                    // focusNode: loginVM.emailFocusNode.value,
                    decoration: InputDecoration(
                        hintText: "Enter Email", border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.snackBar('Email', 'Enter Email');
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: loginVM.passwordController.value,
                    // focusNode: loginVM.emailFocusNode.value,
                    decoration: InputDecoration(
                        hintText: "Enter Password",
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.snackBar('Password', 'Enter Password');
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Obx(
              () => RoundButton(
                title: 'Login',
                buttoncolor: AppColor.appcolor,
                textcolor: AppColor.whitecolor,
                loading: loginVM.loading.value,
                width: width(1, context),
                onpress: () {
                  if (loginkey.currentState!.validate()) {
                    loginVM.loginApi();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
