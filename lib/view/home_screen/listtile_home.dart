import 'package:flutter/material.dart';
import 'package:getxmvvm/res/colors/app_colors.dart';

class listTileForHome extends StatelessWidget {
  const listTileForHome(
      {super.key,
      required this.title,
      required this.onpress,
      this.tilecolor = AppColor.whitecolor,
      required this.leadingicon});

  final String title;
  final VoidCallback onpress;
  final Color tilecolor;
  final Icon leadingicon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: ListTile(
          tileColor: tilecolor,
          leading: leadingicon,
          title: Text(title),
          onTap: onpress),
    );
  }
}
