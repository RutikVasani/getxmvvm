// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:getxmvvm/models/login/user_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class UserPreference extends GetxController {

//   Future<bool> saveUser(UserModel responceModel) async {
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     sp.setString('token', responceModel.token.toString());
//     return true;
//   }

//   Future<UserModel> getUser() async {
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     String? token = sp.getString('token');
//     return UserModel(
//       token: token
//     );
//   }

//   Future<bool> removeUser() async {
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     sp.clear();
//     return true;
//   }
// }
