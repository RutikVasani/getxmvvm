import 'package:getxmvvm/res/colors/app_colors.dart';
import 'package:getxmvvm/res/text/text.dart';
import 'package:getxmvvm/view/calendar/calendar.dart';
import 'package:getxmvvm/view/member_progress.dart/member_attendance.dart';
import 'package:getxmvvm/view/member_progress.dart/progress_attendance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberProgress extends StatefulWidget {
  const MemberProgress({super.key});

  @override
  State<MemberProgress> createState() => _MemberProgressState();
}

class _MemberProgressState extends State<MemberProgress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.appcolor,
        title: boldtText("Report", 0.06, AppColor.whitecolor, context),
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
            Padding(
              padding: const EdgeInsets.all(10),
              child: CalendarView(),
            ),
            ProgressAttendance(),
            MemberAttendance()
          ],
        ),
      ),
    );
  }
}
