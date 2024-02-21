import 'package:getxmvvm/res/text/text.dart';
import 'package:flutter/material.dart';
import 'package:getxmvvm/res/colors/app_colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {super.key,
      this.loading = false,
      required this.title,
      this.width = 50,
      this.height = 50,
      required this.onpress,
      this.textcolor = Colors.black,
      this.buttoncolor = Colors.white});

  final bool loading;
  final String title;
  final double width, height;
  final VoidCallback onpress;
  final Color textcolor, buttoncolor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: buttoncolor, borderRadius: BorderRadius.circular(50)),
        child: loading
            ? Center(child: CircularProgressIndicator())
            : Center(
                child: boldtText(title, 0.05, AppColor.whitecolor, context)),
      ),
    );
  }
}
