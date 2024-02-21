import 'package:getxmvvm/res/colors/app_colors.dart';
import 'package:getxmvvm/res/text/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Renew2DaysMembership extends StatefulWidget {
  const Renew2DaysMembership({super.key});

  @override
  State<Renew2DaysMembership> createState() => _Renew2DaysMembershipState();
}

class _Renew2DaysMembershipState extends State<Renew2DaysMembership> {
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
