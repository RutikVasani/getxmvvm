import 'package:getxmvvm/res/colors/app_colors.dart';
import 'package:getxmvvm/res/text/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RenewFinishMembership extends StatefulWidget {
  const RenewFinishMembership({super.key});

  @override
  State<RenewFinishMembership> createState() => _RenewFinishMembershipState();
}

class _RenewFinishMembershipState extends State<RenewFinishMembership> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.appcolor,
        title: text("Renew Membership", 0.06, AppColor.whitecolor, context),
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
    );
  }
}
