import 'package:flutter/material.dart';
import 'package:getxmvvm/res/colors/app_colors.dart';

class searchTextFiled extends StatefulWidget {
  const searchTextFiled({super.key, required this.title});

  final String title;

  @override
  State<searchTextFiled> createState() => _searchTextFiledState();
}

class _searchTextFiledState extends State<searchTextFiled> {
  String _Search = "";

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: widget.title,
        labelStyle: TextStyle(color: AppColor.blackcolor),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.appcolor),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
      onChanged: (value) {
        setState(() {
          _Search = value;
        });
      },
    );
  }
}
