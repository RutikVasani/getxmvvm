import 'package:getxmvvm/res/colors/app_colors.dart';
import 'package:getxmvvm/res/text/text.dart';
import 'package:getxmvvm/utils/utils.dart';
import 'package:getxmvvm/view_models/controller/member/member_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProfileImage extends StatefulWidget {
  const AddProfileImage({super.key});

  @override
  State<AddProfileImage> createState() => _AddProfileImageState();
}

class _AddProfileImageState extends State<AddProfileImage> {
  MemberController addmemberVM = Get.put(MemberController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() {
        return Center(
          child: Stack(children: <Widget>[
            CircleAvatar(
              radius: 80.0,
              backgroundImage: addmemberVM.imageUrl.isNotEmpty
                  ? NetworkImage(
                      addmemberVM.imageUrl.toString(),
                    )
                  : null,
            ),
            Positioned(
              bottom: 10.0,
              right: 1.0,
              child: InkWell(
                onTap: () {
                  if (addmemberVM.mobilenocontroller.value.text.isEmpty) {
                    Utils.toastMessage("Enter Mobile First");
                  } else {
                    showModalBottomSheet(
                      context: context,
                      builder: ((builder) => bottomSheet()),
                    );
                  }
                },
                child: CircleAvatar(
                  backgroundColor: AppColor.whitecolor,
                  child: Icon(
                    Icons.camera_alt,
                    color: AppColor.blackcolor,
                    size: 28.0,
                  ),
                ),
              ),
            ),
          ]),
        );
      }),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () async {
                    addmemberVM.getCameraimageUrl();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.camera,
                        color: AppColor.appcolor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      text("Camera", 0.04, AppColor.blackcolor, context)
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    addmemberVM.getgalleryimageUrl();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.image,
                        color: AppColor.appcolor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      text("Gallery", 0.04, AppColor.blackcolor, context)
                    ],
                  ),
                ),
              ]),
        ],
      ),
    );
  }
}
