import 'package:getxmvvm/view/home_screen/home_screen.dart';
import 'package:getxmvvm/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RolePage extends StatelessWidget {
  final String uid;
  const RolePage({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("done");
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Member Position')
          .doc(uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.data!.exists) {
          return checkRole(snapshot);
        }
        // return RouteName.loginScreen;
        return LoginScreen();
      },
    );
  }

  Widget checkRole(AsyncSnapshot<DocumentSnapshot> snapshot) {
    if (snapshot.data!["Role"] == 'trainer') {
      return HomeScreen();
    } else {
      return LoginScreen();
    }
  }
}
