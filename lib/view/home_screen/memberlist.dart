import 'package:getxmvvm/res/colors/app_colors.dart';
import 'package:getxmvvm/res/routes/routes_name.dart';
import 'package:getxmvvm/res/size/size.dart';
import 'package:getxmvvm/res/text/text.dart';
import 'package:getxmvvm/view_models/controller/attendance/attendance_controller.dart';
import 'package:getxmvvm/view_models/controller/member/get_member_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageMemberList extends StatefulWidget {
  const HomePageMemberList({super.key});

  @override
  State<HomePageMemberList> createState() => _HomePageMemberListState();
}

class _HomePageMemberListState extends State<HomePageMemberList> {
  getMemberController getMemberVM = Get.put(getMemberController());
  AttendanceController attendanceVM = Get.put(AttendanceController());

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    getMemberVM.getMember();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(0.47, context),
      child: Obx(
        () {
          return ListView.builder(
            itemCount: getMemberVM.memberlist.length,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(
                      RouteName.memberProfile,
                      arguments: {
                        "profilePhoto":
                            getMemberVM.memberlist[index].profilePhoto,
                        "name": getMemberVM.memberlist[index].name,
                        "reason": getMemberVM.memberlist[index].reason,
                        "level": getMemberVM.memberlist[index].level,
                        "endDate": getMemberVM.memberlist[index].endDate,
                        "payment": getMemberVM.memberlist[index].totalPayment,
                        "pay": getMemberVM.memberlist[index].pay,
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: width(0.06, context),
                                  backgroundImage: NetworkImage(
                                    getMemberVM.memberlist[index].profilePhoto,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                          width: width(0.7, context),
                                          child: boldtText(
                                              getMemberVM
                                                  .memberlist[index].name,
                                              0.04,
                                              AppColor.blackcolor,
                                              context)),
                                      SizedBox(
                                        width: width(0.7, context),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            text(
                                                getMemberVM
                                                    .memberlist[index].reason,
                                                0.04,
                                                AppColor.browncolor,
                                                context),
                                            text(
                                                getMemberVM
                                                    .memberlist[index].level,
                                                0.04,
                                                AppColor.browncolor,
                                                context),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    attendanceVM.attendanceApi(
                                        getMemberVM.memberlist[index].name,
                                        getMemberVM.memberlist[index].mobileNo);
                                  },
                                  child: Container(
                                    width: width(0.4, context),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: boldtText("Attendance", 0.045,
                                            AppColor.whitecolor, context),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: width(0.4, context),
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: boldtText("Call", 0.045,
                                            AppColor.whitecolor, context),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
