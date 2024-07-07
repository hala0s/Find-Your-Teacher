import 'package:find_your_teacher/features/notfications/presentation/pages/teacher_notifaction.dart';
import 'package:find_your_teacher/features/student_home/presentation/pages/teacher_settings.dart';
import 'package:find_your_teacher/features/teacher_home/presentation/pages/edit_profile/teacher_edit_info.dart';
import 'package:find_your_teacher/features/teacher_home/presentation/pages/profile.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../../core/bloc/app_state_bloc.dart';
import '../../../../core/theme/colors.dart';
import '../../../../injection/injection.dart';
import '../../../search and filter/data/models/filter_model.dart';
import '../../../teacher auth/presentation/manager/second_complete_profile/second_complete_profile_bloc.dart';
import '../../data/models/profile_model.dart';
import '../manager/get_teacher_profile_bloc.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({
    Key? key,
  }) : super(key: key);
  static String name = "nav_bar_screen";
  static String path = "/nav_bar_screen";

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<GetTeacherProfileBloc>()..add(GetTeacherProfileE()),
      child: BlocSelector<GetTeacherProfileBloc, GetTeacherProfileState,
          BlocStateData<TeacherProfileModel>>(
        selector: (state) => state.teacherProfile,
        builder: (context, state) {
          final name = state.data?.user.userName ?? "";
          final about = state.data?.user.aboutMe ?? "لا يوجد شرح ";
          final subjects = state.data?.user.subjectName ?? [];
          final locations = state.data?.user.locationsName ?? [];
          final locationsId = state.data?.user.locations ?? [];
          final subjectsId = state.data?.user.subjects ?? [];
          final price = state.data?.user.price ?? 0;
          final img = state.data?.user.profilePhoto.url ??
              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png";

          final List<Widget> screens = _buildScreens(
            name, about, subjects, locations, price, img, locationsId, subjectsId,
          );

          return Scaffold(
            body: screens[_selectedIndex],
            bottomNavigationBar: FlashyTabBar(
              selectedIndex: _selectedIndex,
              items: _navBarsItems(),
              backgroundColor: Colors.white,
              onItemSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          );
        },
      ),
    );
  }
}

List<Widget> _buildScreens(
    String name, String about, List<String> subjects, List<String> locations, int price, String img, List<String> locationIds, List<String> subjectsId) {
  return [
    TeachersProfile(
      userName: name,
      aboutMe: about,
      subjects: subjects,
      locations: locations,
      price: price,
      img: img,
    ),
    TeacherEditInfo(
      price: price,
      aboutMe: about,
    ),
    const TeacherSettingsUi(),
    NotificationScreen(),
  ];
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
      icon: Center(child: PhosphorIcon(PhosphorIcons.user())),
      activeColor: lightColorScheme.primary,
      inactiveColor: CupertinoColors.systemGrey,
      title: const Text("Profile"),
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
