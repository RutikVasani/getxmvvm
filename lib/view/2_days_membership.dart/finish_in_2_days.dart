import 'package:getxmvvm/res/colors/app_colors.dart';
import 'package:getxmvvm/res/text/text.dart';
import 'package:getxmvvm/view/2_days_membership.dart/2_days_membhip_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinishIn2Days extends StatefulWidget {
  const FinishIn2Days({super.key});

  @override
  State<FinishIn2Days> createState() => _FinishIn2DaysState();
}

class _FinishIn2DaysState extends State<FinishIn2Days> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.appcolor,
        title: text("Finish In 2 Days", 0.06, AppColor.whitecolor, context),
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
        child: Column(
          children: [
            Days2MembershipContainer(),
          ],
        ),
      ),
    );
  }
}
