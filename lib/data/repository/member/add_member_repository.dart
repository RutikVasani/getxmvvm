import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddMemberRepository {
  FirebaseFirestore _firebasestore = FirebaseFirestore.instance;

  Future<dynamic> addMemberApi(Map<String, dynamic> data) async {
    var response = await _firebasestore
        .collection("Members")
        .doc(data["mobile no"])
        .set(data);
    await _firebasestore.collection("Plan Data").doc().set({
      "mobile no": data["mobile no"],
      'plan': data['plan'],
      'type': "new",
      'reason': data['reason'],
      'date': data['joining date']
    });
    return response;
  }

  Future<String> uploadImageToStorage(String id, File imageFile) async {
    Reference ref = FirebaseStorage.instance.ref().child('profile').child(id);
    UploadTask uploadTask = ref.putFile(imageFile);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}
