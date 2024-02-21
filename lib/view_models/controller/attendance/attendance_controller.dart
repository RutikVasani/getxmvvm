import 'package:getxmvvm/data/repository/attendance/attendance_repository.dart';
import 'package:getxmvvm/utils/utils.dart';
import 'package:getxmvvm/view_models/controller/attendance/get_attendance.controller.dart';
import 'package:get/get.dart';

class AttendanceController extends GetxController {
  final _api = AttendanceRepository();

  RxString name = "".obs;
  RxString mobileno = "".obs;
  Rx time = DateTime.now().obs;

  void attendanceApi(name, mobileno) {
    //   loading.value = true;
    var data = {
      'name': name,
      'mobile no': mobileno,
      'time': time.value,
    };

    _api.attendance(data).then((value) {
      // loading.value = false;
      // Get.back();
      Utils.toastMessage("Successfully taken");
      GetAttendanceController().obs;
      // }).onError((error, stackTrace) {});
    }).onError((error, stackTrace) {
      Utils.snackBar('Error', error.toString());
      // loading.value = false;
    });
  }
}
