import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getxmvvm/models/attendance/attendance_model.dart';
import 'package:getxmvvm/utils/utils.dart';
import 'package:get/get.dart';

class GetAttendanceController extends GetxController {
  RxList<dynamic> attendancelist = [].obs;
  RxList<dynamic> morningAttendancelist = [].obs;
  RxList<dynamic> eveningEveninglist = [].obs;

  DateTime targetTime = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 12);
  DateTime targetDate1 =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime targetDate2 =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .add(Duration(days: 1));

  Future<dynamic> getAttendance() async {
    try {
      QuerySnapshot data = await FirebaseFirestore.instance
          .collection("Member Attendance")
          .get();
      attendancelist.clear();
      morningAttendancelist.clear();
      eveningEveninglist.clear();

      print("object");
      for (var attendance in data.docs) {
        if (attendance['time'].toDate().isAfter(targetDate1) &&
            attendance['time'].toDate().isBefore(targetDate2)) {
          attendancelist.add(
            AttendanceModel(
              attendance['name'],
              attendance['mobile no'],
              attendance['time'].toDate(),
            ),
          );

          if (attendance['time'].toDate().isAfter(targetTime)) {
            eveningEveninglist.add(
              // [
              AttendanceModel(
                attendance['name'],
                attendance['mobile no'],
                attendance['time'].toDate(),
              ),
            );
            // print("evening");
          } else if (attendance['time'].toDate().isBefore(targetTime)) {
            morningAttendancelist.add(
              // [
              AttendanceModel(
                attendance['name'],
                attendance['mobile no'],
                attendance['time'].toDate(),
              ),
            );
          }
        }
      }
      print(attendancelist);
    } catch (e) {
      Utils.snackBar("Error", e.toString());
    }
    print("object1");
  }
}
