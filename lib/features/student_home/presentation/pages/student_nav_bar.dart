import 'package:find_your_teacher/features/notification_student/presentation/pages/student_notification_screen.dart';
import 'package:find_your_teacher/features/student_home/presentation/pages/search_page_screen.dart';
import 'package:find_your_teacher/features/student_home/presentation/pages/student_home_page.dart';
import 'package:find_your_teacher/features/student_home/presentation/pages/teacher_settings.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class _StudentNavBarScreenState extends State<StudentNavBarScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const StudentHomePage(),
    SearchPageScreen(),
    const TeacherSettingsUi(),
    const StudentNotificationScreen(),
  ];

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        items: _navBarsItems(),
        backgroundColor: lightColorScheme.onPrimary,
        onItemSelected: _onItemSelected,
      ),
    );
  }
}

List<FlashyTabBarItem> _navBarsItems() {
  return [
    FlashyTabBarItem(
      icon: Center(
        child: PhosphorIcon(
          PhosphorIcons.house(),
        ),
      ),
      activeColor: lightColorScheme.primary,
      inactiveColor: CupertinoColors.systemGrey,
      title: const Text("Home"),
    ),
    FlashyTabBarItem(
      icon: Center(child: PhosphorIcon(PhosphorIcons.magnifyingGlass())),
      activeColor: lightColorScheme.primary,
      inactiveColor: CupertinoColors.systemGrey,
      title: const Text("Search"),
    ),
    FlashyTabBarItem(
      icon: Center(child: PhosphorIcon(PhosphorIcons.gearSix())),
      activeColor: lightColorScheme.primary,
      inactiveColor: CupertinoColors.systemGrey,
      title: const Text("Settings"),
    ),
    FlashyTabBarItem(
      icon: Center(child: PhosphorIcon(PhosphorIcons.bell())),
      activeColor: lightColorScheme.primary,
      inactiveColor: CupertinoColors.systemGrey,
      title: const Text("Notifications"),
    ),
  ];
}
