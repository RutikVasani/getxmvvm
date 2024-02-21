import 'package:getxmvvm/res/colors/app_colors.dart';
import 'package:getxmvvm/res/size/size.dart';
import 'package:getxmvvm/res/text/text.dart';
import 'package:flutter/material.dart';

class MemberAttendance extends StatefulWidget {
  const MemberAttendance({super.key});

  @override
  State<MemberAttendance> createState() => _MemberAttendanceState();
}

class _MemberAttendanceState extends State<MemberAttendance> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(0.37, context),
      child: ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(10),
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
                            "10/02/2024", 0.05, AppColor.blackcolor, context),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              boldtText("Entry: ", 0.045, AppColor.blackcolor,
                                  context),
                              text("9.30 PM", 0.045, AppColor.blackcolor,
                                  context),
                            ],
                          ),
                        ),
                        text("Lower Body", 0.045, AppColor.browncolor, context),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
