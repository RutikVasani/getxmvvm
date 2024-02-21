import 'package:getxmvvm/res/colors/app_colors.dart';
import 'package:getxmvvm/res/routes/routes_name.dart';
import 'package:getxmvvm/res/text/text.dart';
import 'package:getxmvvm/view_models/controller/attendance/get_attendance.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAttendancePage extends StatefulWidget {
  const HomeAttendancePage({super.key});

  @override
  State<HomeAttendancePage> createState() => _HomeAttendancePageState();
}

class _HomeAttendancePageState extends State<HomeAttendancePage> {
  GetAttendanceController attendanceVm = Get.put(GetAttendanceController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
          onTap: () {
            Get.toNamed(RouteName.attendance);
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
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
                      text("Today", 0.045, AppColor.appcolor, context),
                    ],
                  ),
                  Column(
                    children: [
                      boldtText(
                          attendanceVm.morningAttendancelist.length.toString(),
                          0.045,
                          AppColor.blackcolor,
                          context),
                      text("Morning", 0.045, AppColor.appcolor, context),
                    ],
                  ),
                  Column(
                    children: [
                      boldtText(
                          attendanceVm.eveningEveninglist.length.toString(),
                          0.045,
                          AppColor.blackcolor,
                          context),
                      text("Evening", 0.045, AppColor.appcolor, context),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
