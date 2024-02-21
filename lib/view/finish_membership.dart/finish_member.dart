import 'package:getxmvvm/res/colors/app_colors.dart';
import 'package:getxmvvm/res/text/text.dart';
import 'package:getxmvvm/view/finish_membership.dart/finish_membership_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinishMembership extends StatefulWidget {
  const FinishMembership({super.key});

  @override
  State<FinishMembership> createState() => _FinishMembershipState();
}

class _FinishMembershipState extends State<FinishMembership> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.appcolor,
        title: text("Finish Membership", 0.06, AppColor.whitecolor, context),
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
            FinishMembershipContainer(),
          ],
        ),
      ),
    );
  }
}
