import 'package:cloud_firestore/cloud_firestore.dart';

class AttendanceRepository {
  FirebaseFirestore _firebasestore = FirebaseFirestore.instance;

  Future<dynamic> attendance(Map<String, dynamic> data) async {
    String uid = data['mobile no'] +
        '${DateTime.now().day}' +
        '${DateTime.now().month}' +
        '${DateTime.now().year}';
    var response = await _firebasestore
        .collection("Member Attendance")
        .doc(uid)
        .set(data);
    return response;
  }
}
