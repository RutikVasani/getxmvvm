import 'package:getxmvvm/res/colors/app_colors.dart';
import 'package:getxmvvm/res/size/size.dart';
import 'package:getxmvvm/res/text/text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MemberProfileData extends StatefulWidget {
  final String profilePhoto;
  final String name;
  final String reason;
  final String level;
  final DateTime endDate;
  final String payment;
  final String pay;
  const MemberProfileData(
      {super.key,
      required this.profilePhoto,
      required this.name,
      required this.reason,
      required this.level,
      required this.endDate,
      required this.payment,
      required this.pay});

  @override
  State<MemberProfileData> createState() => _MemberProfileDataState();
}

class _MemberProfileDataState extends State<MemberProfileData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 5),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1),
          color: AppColor.appcolor,
          // gradient: const LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomRight,
          //   colors: [
          //     // Color.fromARGB(255, 16, 121, 174),
          //     // Color.fromARGB(255, 167, 200, 217)
          //     AppColor.appcolor,
          //     AppColor.backgroundColor
          //   ],
          // ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: width(0.1, context),
                    backgroundImage: NetworkImage(
                      widget.profilePhoto,
                    ),
                  ),
                  SizedBox(
                    width: width(0.62, context),
                    height: width(0.18, context),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: boldtText(
                              widget.name, 0.06, AppColor.whitecolor, context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                thickness: 1,
                color: AppColor.blackcolor,
              ),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child:
                        text(widget.reason, 0.04, AppColor.whitecolor, context),
                  ),
                  SizedBox(
                    height: width(0.045, context),
                    child: VerticalDivider(
                      thickness: 2,
                      color: AppColor.blackcolor,
                    ),
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: text(
                          widget.level, 0.04, AppColor.whitecolor, context)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                thickness: 1,
                color: AppColor.blackcolor,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    boldtText(
                        'End Date:  ', 0.04, AppColor.blackcolor, context),
                    text(DateFormat.yMMMEd().format(widget.endDate), 0.04,
                        AppColor.whitecolor, context),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    boldtText(
                        'Remaining Day: ', 0.04, AppColor.blackcolor, context),
                    text(
                        widget.endDate
                                .difference(DateTime.now())
                                .inDays
                                .toString() +
                            " days",
                        0.04,
                        AppColor.whitecolor,
                        context)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        boldtText(
                            'Total:  ', 0.04, AppColor.blackcolor, context),
                        text(
                            widget.payment, 0.04, AppColor.whitecolor, context),
                      ],
                    ),
                    Row(
                      children: [
                        boldtText('Pay:  ', 0.04, AppColor.blackcolor, context),
                        text(widget.pay, 0.04, AppColor.whitecolor, context),
                      ],
                    ),
                    Row(
                      children: [
                        boldtText(
                            'Remain:  ', 0.04, AppColor.blackcolor, context),
                        text(
                            '${int.parse(widget.payment) - int.parse(widget.pay)}',
                            0.04,
                            AppColor.whitecolor,
                            context),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
