import 'package:getxmvvm/res/colors/app_colors.dart';
import 'package:getxmvvm/res/routes/routes_name.dart';
import 'package:getxmvvm/res/size/size.dart';
import 'package:getxmvvm/res/text/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinishMembershipContainer extends StatefulWidget {
  const FinishMembershipContainer({super.key});

  @override
  State<FinishMembershipContainer> createState() =>
      _FinishMembershipContainerState();
}

class _FinishMembershipContainerState extends State<FinishMembershipContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(0.9, context),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: InkWell(
              onTap: () => Get.toNamed(RouteName.renewFinishMembership),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: boldtText("Rutik Vasani", 0.045,
                            AppColor.blackcolor, context),
                      ),
                      Divider(
                        thickness: 1.5,
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          boldtText(
                              "Last Day: ", 0.04, AppColor.blackcolor, context),
                          // '${_membershipEndDate!.day}/${_membershipEndDate!.month}/${_membershipEndDate!.year}',
                          text("2/3/2024", 0.04, AppColor.browncolor, context),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          boldtText(
                              "Due In: ", 0.04, AppColor.blackcolor, context),
                          // '${remainingDuration.inDays} days',
                          text("2 days", 0.04, AppColor.redcolor, context)
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              // String mobileno = "+91" + Memberdata["Mobile No"];
                              // String message = "Hello " +
                              //     Memberdata["Name"] +
                              //     ", \n\nYour Transform Gym membership is expiring in " +
                              //     remainingDuration.inDays.toString() +
                              //     " days. We kindly request you to renew your membership as soon as possible.\n\n" +
                              //     "Thank you,\nTransform Gym";

                              // final Uri whatsapp = Uri.parse(
                              //     'whatsapp://send/?phone=$mobileno&text=$message');

                              // // ignore: deprecated_member_use
                              // await launchUrl(whatsapp);
                            },
                            child: Container(
                              width: width(0.4, context),
                              height: height(0.05, context),
                              decoration: BoxDecoration(
                                  color: AppColor.green900,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: text("Whatsapp", 0.045,
                                    AppColor.whitecolor, context),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              // String mobileno = "+91" + Memberdata["Mobile No"];
                              // final Uri call = Uri(scheme: 'tel', path: mobileno);
                              // // ignore: deprecated_member_use
                              // if (await canLaunch(call.toString())) {
                              //   // ignore: deprecated_member_use
                              //   await launch(call.toString());
                              // } else {
                              //   print("no action");
                              // }
                            },
                            child: Container(
                              width: width(0.4, context),
                              height: height(0.05, context),
                              decoration: BoxDecoration(
                                  color: AppColor.greencolor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: text("Call", 0.045,
                                      AppColor.whitecolor, context)),
                            ),
                          ),
                        ],
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
  }
}
