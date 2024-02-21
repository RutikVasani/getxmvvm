import 'package:firebase_auth/firebase_auth.dart';

class LoginRepository {
  final _firebaseauth = FirebaseAuth.instance;

  Future<UserCredential> loginApi(Map data) async {
    UserCredential response = await _firebaseauth.signInWithEmailAndPassword(
        email: data['email'], password: data['password']);
    return response;
  }
}
