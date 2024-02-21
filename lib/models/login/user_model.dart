import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  UserCredential? token;

  UserModel({this.token});

  UserModel.fromJson(userCredential) {
    token = userCredential['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}
