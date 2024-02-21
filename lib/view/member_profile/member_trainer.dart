import 'package:getxmvvm/res/colors/app_colors.dart';
import 'package:getxmvvm/res/size/size.dart';
import 'package:getxmvvm/res/text/text.dart';
import 'package:flutter/material.dart';

class MemberTrainer extends StatefulWidget {
  const MemberTrainer({super.key});

  @override
  State<MemberTrainer> createState() => _MemberTrainerState();
}

class _MemberTrainerState extends State<MemberTrainer> {
  bool _trainer = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListTile(
        title: boldtText("Mayur Sir", 0.045, AppColor.blackcolor, context),
        // subtitle: Text(MemberData["Trainer"]),
        subtitle: Text("Trainer"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        tileColor: Color.fromARGB(255, 16, 121, 174),
        textColor: Colors.white,
        iconColor: Colors.white,
        leading: Icon(
          Icons.person_sharp,
          size: width(0.1, context),
        ),
        trailing: TextButton(
            onPressed: () {
              setState(() {
                _trainer = !_trainer;
              });
            },
            child: text("Change", 0.04, AppColor.whitecolor, context)),
      ),
    );
  }
}
