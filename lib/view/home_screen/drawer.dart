import 'package:getxmvvm/res/colors/app_colors.dart';
import 'package:getxmvvm/res/routes/routes_name.dart';
import 'package:getxmvvm/view/home_screen/listtile_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColor.appcolor),
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.transparent),
              currentAccountPicture: ClipOval(
                child: Image.asset("assets/images/logo.png"),
              ),
              accountName: Text(
                "Trainer",
              ),
              accountEmail: Text("Ekdant Fitness"),
            ),
          ),
          listTileForHome(
            title: "Add Member",
            onpress: () => Get.toNamed(RouteName.addmember),
            leadingicon: Icon(Icons.dashboard),
          ),
          listTileForHome(
            title: "Attendance",
            onpress: () => Get.toNamed(RouteName.attendance),
            leadingicon: Icon(Icons.dashboard),
          ),
          listTileForHome(
            title: "Membership Finish In 2 Days",
            onpress: () => Get.toNamed(RouteName.finshIn2Days),
            leadingicon: Icon(Icons.dashboard),
          ),
          listTileForHome(
            title: "Finished Membership",
            onpress: () => Get.toNamed(RouteName.finishMembership),
            leadingicon: Icon(Icons.dashboard),
          ),
        ],
      ),
    );
  }
}
