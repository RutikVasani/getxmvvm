import 'dart:io';
import 'package:getxmvvm/data/repository/member/add_member_repository.dart';
import 'package:getxmvvm/utils/utils.dart';
import 'package:getxmvvm/view_models/controller/member/get_member_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MemberController extends GetxController {
  final _api = AddMemberRepository();

  final namecontroller = TextEditingController().obs;
  final mobilenocontroller = TextEditingController().obs;
  RxString dropdownjoiningreason = "Cardio".obs;
  var joingDate = DateTime.now().obs;
  RxString dropdownMembership = "Select Any".obs;
  var endDate = DateTime.now().obs;
  final tpayment = TextEditingController().obs;
  final pay = TextEditingController().obs;
  RxString dropdownBatchtime = "Morning".obs;
  RxString dropdownLevel = "Begineer".obs;

  RxString imageUrl = "".obs;
  RxBool pickImg = false.obs;

  RxBool loading = false.obs;

  Future getCameraimageUrl() async {
    final ImagePicker _picker = ImagePicker();
    final image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (image != null) {
      String responce = await _api.uploadImageToStorage(
        mobilenocontroller.value.toString(),
        File(image.path),
      );
      if (responce.toString().isNotEmpty) {
        imageUrl.value = responce;
      }
    }
  }

  Future getgalleryimageUrl() async {
    final ImagePicker _picker = ImagePicker();
    final image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (image != null) {
      String responce = await _api.uploadImageToStorage(
        mobilenocontroller.value.text,
        File(image.path),
      );
      if (responce.toString().isNotEmpty) {
        imageUrl.value = responce;
      }
    }
  }

  void addMemberApi() {
    loading.value = true;
    var data = {
      'profile photo': imageUrl.value,
      'name': namecontroller.value.text,
      'mobile no': mobilenocontroller.value.text,
      'reason': dropdownjoiningreason.value,
      'joining date': joingDate.value,
      'plan': dropdownMembership.value,
      'end date': endDate.value,
      'total payment': tpayment.value.text,
      'pay': pay.value.text,
      'batch time': dropdownBatchtime.value,
      'level': dropdownLevel.value,
    };

    _api.addMemberApi(data).then((value) {
      loading.value = false;
      Get.back();
      Utils.toastMessage("New member added successfully");
      getMemberController().obs;
      // }).onError((error, stackTrace) {});
    }).onError((error, stackTrace) {
      Utils.snackBar('Error', error.toString());
      loading.value = false;
    });
  }
}
