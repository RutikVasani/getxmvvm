import 'package:getxmvvm/res/colors/app_colors.dart';
import 'package:getxmvvm/res/routes/routes_name.dart';
import 'package:getxmvvm/res/size/size.dart';
import 'package:getxmvvm/res/text/text.dart';
import 'package:getxmvvm/view/member_profile/member_profile_data.dart';
import 'package:getxmvvm/view/member_profile/member_trainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberProfilePage extends StatefulWidget {
  const MemberProfilePage({super.key});

  @override
  State<MemberProfilePage> createState() => _MemberProfilePageState();
}

class _MemberProfilePageState extends State<MemberProfilePage> {
  final Map<String, dynamic> args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.appcolor,
        title: boldtText("Profile", 0.06, AppColor.whitecolor, context),
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
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(RouteName.memberProgress);
            },
            icon: Icon(
              Icons.calendar_month_outlined,
              size: width(0.06, context),
              color: AppColor.whitecolor,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MemberProfileData(
              profilePhoto: args['profilePhoto'],
              name: args['name'],
              reason: args['reason'],
              level: args['level'],
              endDate: args['endDate'],
              payment: args['payment'],
              pay: args['pay'],
              // data: args,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: boldtText("Trainer Details: ", 0.045,
                      AppColor.blackcolor, context)),
            ),
            MemberTrainer()
          ],
        ),
      ),
    );
  }
}
