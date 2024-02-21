import 'package:getxmvvm/data/repository/login_repository/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmvvm/res/routes/routes_name.dart';
import 'package:getxmvvm/utils/utils.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

  // UserPreference userPreference = UserPreference();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };

    _api.loginApi(data).then((value) {
      loading.value = false;
      // userPreference
      //     .saveUser(UserModel.fromJson(value))
      //     .then((value) {
      Get.toNamed(RouteName.homeScreen);
      Utils.toastMessage("Login successfully");
      // }).onError((error, stackTrace) {});
    }).onError((error, stackTrace) {
      Utils.snackBar('Error', "Please Enter Correct Information");
      loading.value = false;
    });
  }
}
