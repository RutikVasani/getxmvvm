import 'package:getxmvvm/res/colors/app_colors.dart';
import 'package:getxmvvm/res/size/size.dart';
import 'package:getxmvvm/res/text/text.dart';
import 'package:flutter/material.dart';

class ProgressAttendance extends StatefulWidget {
  const ProgressAttendance({super.key});

  @override
  State<ProgressAttendance> createState() => _ProgressAttendanceState();
}

class _ProgressAttendanceState extends State<ProgressAttendance> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // ${DateTime(int.parse('${_focusedDay.year}'), int.parse('${_focusedDay.month}') + 1, 0).day}
                    boldtText('29', 0.05, AppColor.browncolor, context),
                    boldtText('Total Days', 0.04, AppColor.blackcolor, context),
                  ],
                ),
              ),
              SizedBox(
                height: width(0.15, context),
                child: VerticalDivider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    boldtText('3', 0.05, AppColor.browncolor, context),
                    boldtText('Present', 0.04, AppColor.blackcolor, context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
