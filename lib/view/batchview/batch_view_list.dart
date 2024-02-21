import 'package:getxmvvm/res/colors/app_colors.dart';
import 'package:getxmvvm/res/routes/routes_name.dart';
import 'package:getxmvvm/res/size/size.dart';
import 'package:getxmvvm/res/text/text.dart';
import 'package:getxmvvm/view_models/controller/member/get_member_controller.dart';
import 'package:getxmvvm/view_models/controller/member/member_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BatchMemberList extends StatefulWidget {
  final String betch;
  const BatchMemberList({super.key, required this.betch});

  @override
  State<BatchMemberList> createState() => _BatchMemberListState();
}

class _BatchMemberListState extends State<BatchMemberList> {
  getMemberController getMemberVM = Get.put(getMemberController());

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    getMemberVM.getMember();
  }

  @override
  Widget build(BuildContext context) {
    var data;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: SizedBox(
        height: height(0.9, context),
        child: GetBuilder<MemberController>(
            init: MemberController(),
            initState: (_) {},
            builder: (wordController) {
              // wordController.getData();
              getMemberVM.getMember();
              if (widget.betch == "Morning") {
                data = getMemberVM.morningMemberlist;
              } else {
                data = getMemberVM.eveningMemberlist;
              }
              return Center(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(RouteName.memberProfile);
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
                                        data[index].profilePhoto,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                              width: width(0.7, context),
                                              child: boldtText(
                                                  data[index].name,
                                                  0.04,
                                                  AppColor.blackcolor,
                                                  context)),
                                          SizedBox(
                                            width: width(0.7, context),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                text(
                                                    data[index].reason,
                                                    0.04,
                                                    AppColor.browncolor,
                                                    context),
                                                text(
                                                    data[index].level,
                                                    0.04,
                                                    AppColor.greencolor,
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
      ),
    );
  }
}
