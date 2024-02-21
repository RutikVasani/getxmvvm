import 'package:getxmvvm/res/colors/app_colors.dart';
import 'package:getxmvvm/res/components/search_filed.dart';
import 'package:getxmvvm/res/text/text.dart';
import 'package:getxmvvm/view/home_screen/drawer.dart';
import 'package:getxmvvm/view/home_screen/home_attendance.dart';
import 'package:getxmvvm/view/home_screen/memberlist.dart';
import 'package:getxmvvm/view/home_screen/members.dart';
import 'package:getxmvvm/view_models/controller/attendance/get_attendance.controller.dart';
import 'package:getxmvvm/view_models/controller/member/get_member_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  getMemberController getMemberVM = Get.put(getMemberController());
  GetAttendanceController getattendanceVM = Get.put(GetAttendanceController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMemberVM.getMember();
    getattendanceVM.getAttendance().obs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.appcolor,
        title: boldtText("Ekdant Fitness", 0.06, AppColor.whitecolor, context),
      ),
      drawer: Drawer(
        backgroundColor: AppColor.backgroundColor,
        child: DrawerPage(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Members(),
            HomeAttendancePage(),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: boldtText(
                      "Member List", 0.045, AppColor.blackcolor, context)),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: searchTextFiled(title: "Search member"),
            ),
            HomePageMemberList(),
          ],
        ),
      ),
    );
  }
}
