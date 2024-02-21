import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getxmvvm/models/member/add_member_model.dart';
import 'package:getxmvvm/utils/utils.dart';
import 'package:get/get.dart';

class getMemberController extends GetxController {
  RxList<dynamic> memberlist = [].obs;
  RxList<dynamic> morningMemberlist = [].obs;
  RxList<dynamic> eveningMemberlist = [].obs;

  Future<dynamic> getMember() async {
    try {
      QuerySnapshot data =
          await FirebaseFirestore.instance.collection("Members").get();
      memberlist.clear();
      morningMemberlist.clear();
      eveningMemberlist.clear();

      print("object");
      for (var member in data.docs) {
        memberlist.add(
          // [
          AddMember(
            member['profile photo'],
            member['name'],
            member['mobile no'],
            member['reason'],
            member['joining date'].toDate(),
            member['plan'],
            member['end date'].toDate(),
            member['total payment'],
            member['pay'],
            member['batch time'],
            member['level'],
          ),
          // ],
        );
        if (member['batch time'] == "Morning") {
          morningMemberlist.add(
            // [
            AddMember(
              member['profile photo'],
              member['name'],
              member['mobile no'],
              member['reason'],
              member['joining date'].toDate(),
              member['plan'],
              member['end date'].toDate(),
              member['total payment'],
              member['pay'],
              member['batch time'],
              member['level'],
            ),
          );
        } else {
          eveningMemberlist.add(
            // [
            AddMember(
              member['profile photo'],
              member['name'],
              member['mobile no'],
              member['reason'],
              member['joining date'].toDate(),
              member['plan'],
              member['end date'].toDate(),
              member['total payment'],
              member['pay'],
              member['batch time'],
              member['level'],
            ),
          );
        }
      }
      print(memberlist);
    } catch (e) {
      Utils.snackBar("Error", e.toString());
    }
    print("object1");
  }
}
