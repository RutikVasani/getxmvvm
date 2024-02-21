import 'package:getxmvvm/res/colors/app_colors.dart';
import 'package:getxmvvm/res/text/text.dart';
import 'package:getxmvvm/view/batchview/batch_view_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BatchView extends StatefulWidget {
  const BatchView({super.key});

  @override
  State<BatchView> createState() => _BatchViewState();
}

class _BatchViewState extends State<BatchView> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.appcolor,
        title: text(args["batch"], 0.06, AppColor.whitecolor, context),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: AppColor.whitecolor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: BatchMemberList(
          betch: args['batch'],
        ),
      ),
    );
  }
}
