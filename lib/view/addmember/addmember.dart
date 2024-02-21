import 'package:getxmvvm/res/colors/app_colors.dart';
import 'package:getxmvvm/res/text/text.dart';
import 'package:getxmvvm/view/addmember/newmember_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMemberPage extends StatefulWidget {
  const AddMemberPage({super.key});

  @override
  State<AddMemberPage> createState() => _AddMemberPageState();
}

class _AddMemberPageState extends State<AddMemberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whitecolor,
      appBar: AppBar(
        backgroundColor: AppColor.appcolor,
        title: text("Add Member", 0.06, AppColor.whitecolor, context),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: AppColor.whitecolor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: NewMembership(),
      ),
    );
  }
}
