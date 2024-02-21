import 'package:getxmvvm/view/2_days_membership.dart/finish_in_2_days.dart';
import 'package:getxmvvm/view/2_days_membership.dart/renew_2_days.dart';
import 'package:getxmvvm/view/addmember/addmember.dart';
import 'package:getxmvvm/view/attendance/attendance.dart';
import 'package:getxmvvm/view/batchview/batch_view.dart';
import 'package:getxmvvm/view/finish_membership.dart/finish_member.dart';
import 'package:getxmvvm/view/finish_membership.dart/renew_finish_membership.dart';
import 'package:getxmvvm/view/home_screen/drawer.dart';
import 'package:getxmvvm/view/home_screen/home_screen.dart';
import 'package:getxmvvm/view/login/login_screen.dart';
import 'package:getxmvvm/view/member_profile/member_profile.dart';
import 'package:getxmvvm/view/member_progress.dart/member_progress.dart';
import 'package:getxmvvm/view/splash_screen.dart';
import 'package:get/get.dart';
import 'package:getxmvvm/res/routes/routes_name.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashScreen,
          page: () => SplashScreenPage(),
          transition: Transition.leftToRight,
          transitionDuration: Duration(milliseconds: 300),
        ),
        GetPage(
          name: RouteName.loginScreen,
          page: () => LoginScreen(),
          transition: Transition.leftToRight,
          transitionDuration: Duration(milliseconds: 300),
        ),
        GetPage(
          name: RouteName.homeScreen,
          page: () => HomeScreen(),
          transition: Transition.leftToRight,
          transitionDuration: Duration(milliseconds: 300),
        ),
        GetPage(
          name: RouteName.drawer,
          page: () => DrawerPage(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: Duration(milliseconds: 300),
        ),
        GetPage(
          name: RouteName.memberProfile,
          page: () => MemberProfilePage(),
          transition: Transition.zoom,
          transitionDuration: Duration(milliseconds: 300),
        ),
        GetPage(
          name: RouteName.memberProgress,
          page: () => MemberProgress(),
          transition: Transition.rightToLeftWithFade,
          transitionDuration: Duration(milliseconds: 300),
        ),
        GetPage(
          name: RouteName.addmember,
          page: () => AddMemberPage(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: Duration(milliseconds: 300),
        ),
        GetPage(
          name: RouteName.attendance,
          page: () => AttendancePage(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: Duration(milliseconds: 300),
        ),
        GetPage(
          name: RouteName.finshIn2Days,
          page: () => FinishIn2Days(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: Duration(milliseconds: 300),
        ),
        GetPage(
          name: RouteName.renew2DaysMembership,
          page: () => Renew2DaysMembership(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: Duration(milliseconds: 300),
        ),
        GetPage(
          name: RouteName.finishMembership,
          page: () => FinishMembership(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: Duration(milliseconds: 300),
        ),
        GetPage(
          name: RouteName.renewFinishMembership,
          page: () => RenewFinishMembership(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: Duration(milliseconds: 300),
        ),
        GetPage(
          name: RouteName.batchView,
          page: () => BatchView(),
          transition: Transition.zoom,
          transitionDuration: Duration(milliseconds: 300),
        ),
      ];
}
