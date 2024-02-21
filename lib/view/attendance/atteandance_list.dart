import 'package:getxmvvm/res/colors/app_colors.dart';
import 'package:getxmvvm/res/size/size.dart';
import 'package:getxmvvm/res/text/text.dart';
import 'package:getxmvvm/view_models/controller/attendance/get_attendance.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AttendanceList extends StatefulWidget {
  const AttendanceList({super.key});

  @override
  State<AttendanceList> createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList> {
  GetAttendanceController attendanceVm = Get.put(GetAttendanceController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(0.33, context),
      child: Obx(
        () => ListView.builder(
            itemCount: attendanceVm.attendancelist.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          //   '${date.day}/${date.month}/${date.year}',
                          child: boldtText(
                              attendanceVm.attendancelist[index].name,
                              0.05,
                              AppColor.blackcolor,
                              context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                boldtText("Entry: ", 0.045, AppColor.blackcolor,
                                    context),
                                text(
                                    DateFormat.jms().format(attendanceVm
                                        .attendancelist[index].time),
                                    0.045,
                                    AppColor.blackcolor,
                                    context),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
