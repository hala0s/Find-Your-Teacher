import 'package:find_your_teacher/features/notification_student/presentation/pages/student_notification_screen.dart';
import 'package:find_your_teacher/features/student_home/presentation/pages/search_page_screen.dart';
import 'package:find_your_teacher/features/student_home/presentation/pages/student_home_page.dart';
import 'package:find_your_teacher/features/student_home/presentation/pages/teacher_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/theme/colors.dart';


class StudentNavBarScreen extends StatefulWidget {
  const StudentNavBarScreen({
    Key? key,
  }) : super(key: key);
  static String name = "student_nav_bar_screen";
  static String path = "/student_nav_bar_screen";

  @override
  State<StudentNavBarScreen> createState() => _StudentNavBarScreenState();
}

PersistentTabController _controller = PersistentTabController(initialIndex: 0);

class _StudentNavBarScreenState extends State<StudentNavBarScreen> {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      padding: const NavBarPadding.only(top: 20),
      navBarHeight: 60.h,
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: lightColorScheme.onPrimary,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(15.0),
        colorBehindNavBar: lightColorScheme.onPrimary,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeOut,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.easeOut,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const StudentHomePage(),
    SearchPageScreen(),
    const TeacherSettingsUi(),
    const StudentNotificationScreen(),

  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      contentPadding: 5.0,
      icon: Center(
        child: PhosphorIcon(
          PhosphorIcons.house(),
        ),
      ),
      activeColorPrimary: lightColorScheme.primary,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Center(child: PhosphorIcon(PhosphorIcons.magnifyingGlass())),
      activeColorPrimary: lightColorScheme.primary,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Center(child: PhosphorIcon(PhosphorIcons.gearSix())),
      activeColorPrimary: lightColorScheme.primary,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ), PersistentBottomNavBarItem(
      icon: Center(child: PhosphorIcon(PhosphorIcons.bell())),
      activeColorPrimary: lightColorScheme.primary,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}
