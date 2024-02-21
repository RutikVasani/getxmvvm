import 'package:getxmvvm/res/colors/app_colors.dart';
import 'package:getxmvvm/res/components/round_button.dart';
import 'package:getxmvvm/res/size/size.dart';
import 'package:getxmvvm/res/text/text.dart';
import 'package:getxmvvm/view/profile_image/add_profile_image.dart';
import 'package:getxmvvm/view_models/controller/member/member_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';

class NewMembership extends StatefulWidget {
  const NewMembership({super.key});

  @override
  State<NewMembership> createState() => _NewMembershipState();
}

class _NewMembershipState extends State<NewMembership> {
  final addmemberVM = Get.put(MemberController());

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    MemberController();
  }

  int tpayment = 0;
  int pay = 0;
  int selectedMonths = 0;

  final _formKey = GlobalKey<FormState>();

  var Membership = [
    'Select Any',
    '1 Month',
    '3 Month',
    '6 Month',
    '1 Year',
  ];

  var Batchtime = [
    'Morning',
    'Evening',
  ];

  var level = [
    'Begineer',
    'Intermediate',
    'Advance',
  ];

  var Reason = [
    'Cardio',
    'Fat loss',
    'Slimming',
    'Weight gain',
    'Personal training',
    'Diet & Nutrition',
    'Fitness suggestion',
    'Body Building',
  ];

  void addMonths() {
    setState(() {
      addmemberVM.endDate.value =
          _addMonths(addmemberVM.endDate.value, selectedMonths);
    });
  }

  DateTime _addMonths(DateTime date, int months) {
    final newYear = date.year + (date.month + months) ~/ 12;
    final newMonth = (date.month + months) % 12;
    final newDay = _min(date.day, _daysInMonth(newYear, newMonth));
    return DateTime(newYear, newMonth, newDay);
  }

  int _daysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  int _min(int a, int b) {
    return a < b ? a : b;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AddProfileImage(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: TextFormField(
                        controller: addmemberVM.mobilenocontroller.value,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: 'Enter Mobile No',
                          labelStyle: TextStyle(
                              color: AppColor.blackcolor, fontSize: 20),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColor.blackcolor, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(width: 1)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty && value.length != 10) {
                            return 'Enter a Mobile No';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: TextFormField(
                        controller: addmemberVM.namecontroller.value,
                        decoration: const InputDecoration(
                          labelText: 'Enter Name',
                          labelStyle: TextStyle(
                              color: AppColor.blackcolor, fontSize: 20),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColor.blackcolor, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(width: 1)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a Name';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: text("Membership Plan", 0.04, AppColor.blackcolor,
                          context),
                    ),
                    Container(
                      width: width(1, context),
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(
                          () => DropdownButton(
                            value: addmemberVM.dropdownjoiningreason.value,
                            dropdownColor: AppColor.whitecolor,
                            underline: const SizedBox(),
                            iconSize: 0,
                            items: Reason.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: text(
                                    items, 0.045, AppColor.blackcolor, context),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                addmemberVM.dropdownjoiningreason.value =
                                    newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: text(
                          "Joining Date", 0.04, AppColor.blackcolor, context),
                    ),
                    Obx(
                      () => InkWell(
                        onTap: () {
                          DatePicker.showDatePicker(
                            context,
                            // theme: const DatePickerTheme(
                            //   containerHeight: 210.0,
                            // ),
                            showTitleActions: true,
                            minTime: DateTime(2000, 1, 1),
                            maxTime: DateTime(2100, 12, 31),
                            onConfirm: (date) {
                              setState(() {
                                addmemberVM.joingDate.value = date;
                                addmemberVM.endDate.value = date;
                              });
                            },
                          );
                        },
                        child: Container(
                          width: width(1, context),
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: text(
                                    '${addmemberVM.joingDate.value.day}/${addmemberVM.joingDate.value.month}/${addmemberVM.joingDate.value.year}',
                                    0.045,
                                    AppColor.blackcolor,
                                    context),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: boldtText(
                                    "Change", 0.04, AppColor.redcolor, context),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //box styling
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text("Membership Time", 0.04, AppColor.blackcolor,
                              context),
                          text(
                              '${addmemberVM.endDate.value.day}/${addmemberVM.endDate.value.month}/${addmemberVM.endDate.value.year}',
                              0.04,
                              AppColor.blackcolor,
                              context),
                        ],
                      ),
                    ),
                    Container(
                      width: width(1, context),
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(
                          () => DropdownButton(
                            value: addmemberVM.dropdownMembership.value,
                            dropdownColor: AppColor.whitecolor,
                            underline: const SizedBox(),
                            iconSize: 0,
                            items: Membership.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: text(
                                    items, 0.045, AppColor.blackcolor, context),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(
                                () {
                                  addmemberVM.dropdownMembership.value =
                                      newValue!;
                                  if (addmemberVM.dropdownMembership.value ==
                                      "1 Month") {
                                    selectedMonths = 1;
                                    addMonths();
                                  } else if (addmemberVM
                                          .dropdownMembership.value ==
                                      "3 Month") {
                                    selectedMonths = 3;
                                    addMonths();
                                  } else if (addmemberVM
                                          .dropdownMembership.value ==
                                      "6 Month") {
                                    selectedMonths = 6;
                                    addMonths();
                                  } else if (addmemberVM
                                          .dropdownMembership.value ==
                                      "1 Year") {
                                    selectedMonths = 12;
                                    addMonths();
                                  } else {
                                    (value) {
                                      if (value == "Select Any") {
                                        return 'Select Membership';
                                      }
                                      return null;
                                    };
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: TextFormField(
                        controller: addmemberVM.tpayment.value,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Total Payment',
                          labelStyle: TextStyle(
                              color: AppColor.blackcolor, fontSize: 20),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColor.blackcolor, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(width: 1)),
                        ),
                        onChanged: (value) {
                          setState(() {
                            tpayment = int.parse(value);
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a total payment';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width(0.45, context),
                            child: TextFormField(
                              controller: addmemberVM.pay.value,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'Payment',
                                labelStyle: TextStyle(
                                    color: AppColor.blackcolor, fontSize: 20),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColor.blackcolor, width: 2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    borderSide: BorderSide(width: 1)),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  pay = int.parse(value);
                                });
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter a pay amount';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            width: width(0.45, context),
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 1)),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: text("${tpayment - pay} Remain", 0.05,
                                    AppColor.blackcolor, context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: text(
                          "Batch Time", 0.04, AppColor.blackcolor, context),
                    ),
                    Container(
                      width: width(1, context),
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(
                          () => DropdownButton(
                            value: addmemberVM.dropdownBatchtime.value,
                            dropdownColor: AppColor.whitecolor,
                            underline: const SizedBox(),
                            iconSize: 0,
                            items: Batchtime.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: text(
                                    items, 0.045, AppColor.blackcolor, context),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                addmemberVM.dropdownBatchtime.value = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    // //box styling
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: text("Level", 0.04, AppColor.blackcolor, context),
                    ),
                    Container(
                      width: width(1, context),
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(
                          () => DropdownButton(
                            value: addmemberVM.dropdownLevel.value,
                            dropdownColor: AppColor.whitecolor,
                            // style: GoogleFonts.poppins(color: Colors.white),
                            underline: const SizedBox(),
                            iconSize: 0,
                            items: level.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: text(
                                    items, 0.045, AppColor.blackcolor, context),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                addmemberVM.dropdownLevel.value = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => RoundButton(
                        title: 'Submit',
                        buttoncolor: AppColor.appcolor,
                        textcolor: AppColor.whitecolor,
                        loading: addmemberVM.loading.value,
                        width: width(1, context),
                        onpress: () {
                          if (_formKey.currentState!.validate()) {
                            addmemberVM.addMemberApi();
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
