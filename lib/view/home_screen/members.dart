import 'package:getxmvvm/res/colors/app_colors.dart';
import 'package:getxmvvm/res/routes/routes_name.dart';
import 'package:getxmvvm/res/text/text.dart';
import 'package:flutter/material.dart';
import 'package:getxmvvm/view_models/controller/member/get_member_controller.dart';
import 'package:get/get.dart';

class Members extends StatefulWidget {
  const Members({super.key});

  @override
  State<Members> createState() => _MembersState();
}

class _MembersState extends State<Members> {
  getMemberController getMemberVM = Get.put(getMemberController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMemberVM.getMember();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(),
              color: Colors.white),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    boldtText(
                        'Total Member: ', 0.05, AppColor.blackcolor, context),
                    boldtText(getMemberVM.memberlist.length.toString(), 0.05,
                        AppColor.appcolor, context),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  thickness: 1.5,
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(RouteName.batchView,
                          arguments: {"batch": "Morning"});
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        text(getMemberVM.morningMemberlist.length.toString(),
                            0.045, AppColor.blackcolor, context),
                        boldtText("Morning", 0.045, AppColor.appcolor, context),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(RouteName.batchView,
                          arguments: {"batch": "Evening"});
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        text(getMemberVM.eveningMemberlist.length.toString(),
                            0.045, AppColor.blackcolor, context),
                        boldtText("Evening", 0.045, AppColor.appcolor, context),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
