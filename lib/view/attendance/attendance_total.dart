import 'package:getxmvvm/res/colors/app_colors.dart';
import 'package:getxmvvm/res/text/text.dart';
import 'package:getxmvvm/view_models/controller/attendance/get_attendance.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceTotal extends StatefulWidget {
  const AttendanceTotal({super.key});

  @override
  State<AttendanceTotal> createState() => _AttendanceTotalState();
}

class _AttendanceTotalState extends State<AttendanceTotal> {
  GetAttendanceController attendanceVm = Get.put(GetAttendanceController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          decoration: BoxDecoration(
              color: AppColor.browncolor,
              border: Border.all(),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    boldtText(attendanceVm.attendancelist.length.toString(),
                        0.045, AppColor.blackcolor, context),
                    text("Today", 0.045, AppColor.whitecolor, context),
                  ],
                ),
                Column(
                  children: [
                    boldtText(
                        attendanceVm.morningAttendancelist.length.toString(),
                        0.045,
                        AppColor.blackcolor,
                        context),
                    text("Morning", 0.045, AppColor.whitecolor, context),
                  ],
                ),
                Column(
                  children: [
                    boldtText(attendanceVm.eveningEveninglist.length.toString(),
                        0.045, AppColor.blackcolor, context),
                    text("Evening", 0.045, AppColor.whitecolor, context),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
