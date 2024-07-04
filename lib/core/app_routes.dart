import 'package:find_your_teacher/core/widgets/splash_screen.dart';
import 'package:find_your_teacher/core/widgets/update_version.dart';
import 'package:find_your_teacher/features/search%20and%20filter/presentation/pages/filter_page.dart';
import 'package:find_your_teacher/features/search%20and%20filter/presentation/pages/filterd_teachers.dart';
import 'package:find_your_teacher/features/student_auth/presentation/pages/choose_major.dart';
import 'package:find_your_teacher/features/student_auth/presentation/pages/log_in_screen.dart';
import 'package:find_your_teacher/features/student_home/presentation/pages/About_screen.dart';
import 'package:find_your_teacher/features/student_home/presentation/pages/all_subjects.dart';
import 'package:find_your_teacher/features/student_home/presentation/pages/search_page_screen.dart';
import 'package:find_your_teacher/features/student_home/presentation/pages/student_home_page.dart';
import 'package:find_your_teacher/features/student_home/presentation/pages/student_nav_bar.dart';
import 'package:find_your_teacher/features/student_home/presentation/pages/teacher_profile_student.dart';
import 'package:find_your_teacher/features/student_home/presentation/pages/top_teachers2.dart';
import 'package:find_your_teacher/features/teacher%20auth/presentation/pages/activate_screen.dart';
import 'package:find_your_teacher/features/teacher%20auth/presentation/pages/complete_register2.dart';
import 'package:find_your_teacher/features/teacher%20auth/presentation/pages/complete_register_1.dart';
import 'package:find_your_teacher/features/teacher%20auth/presentation/pages/conditions.dart';
import 'package:find_your_teacher/features/teacher_home/presentation/pages/edit_profile/teacher_edit_profile.dart';
import 'package:find_your_teacher/features/teacher_home/presentation/pages/nav_bar.dart';
import 'package:find_your_teacher/features/teacher_home/presentation/pages/settings/about_us.dart';
import 'package:find_your_teacher/features/teacher_home/presentation/pages/settings/contac_us_teacher.dart';
import 'package:find_your_teacher/features/teacher_home/presentation/pages/settings/settingd_screen.dart';
import 'package:find_your_teacher/features/teacher_home/presentation/pages/settings/who_we_are.dart';
import 'package:find_your_teacher/features/teacher_home/presentation/pages/settings/who_we_are_teacher.dart';
import 'package:find_your_teacher/onboarding_screen/onboarding_screen.dart';
import 'package:go_router/go_router.dart';
import '../features/notfications/presentation/pages/teacher_notifaction.dart';
import '../features/student_auth/presentation/pages/sign_up_screen.dart';
import '../features/student_home/presentation/pages/teachers_by_sub_id.dart';
import '../features/teacher auth/presentation/pages/get_teacher_profile_before_complete.dart';
import '../features/teacher auth/presentation/pages/log_in_teacher_screen.dart';
import '../features/teacher auth/presentation/pages/sign_up_teacher_screen.dart';
import '../features/teacher_home/presentation/pages/settings/rest_password/check_your_phone.dart';
import '../features/teacher_home/presentation/pages/settings/rest_password/contact_us.dart';
import '../features/teacher_home/presentation/pages/settings/rest_password/first_ui.dart';

final GoRouter router = GoRouter(initialLocation: '/splash_screen', routes: [
  GoRoute(
    path: SplashScreen.path,
    name: SplashScreen.name,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: OnBoardContent.path,
    name: OnBoardContent.name,
    builder: (context, state) => const OnBoardContent(),
  ),

  GoRoute(
    path: StudentRegisterScreen.path,
    name: StudentRegisterScreen.name,
    builder: (context, state) => const StudentRegisterScreen(),
  ),
  GoRoute(
    path: TopTeachers2.path,
    name: TopTeachers2.name,
    builder: (context, state) => const TopTeachers2(),
  ),
  GoRoute(
    path: About.path,
    name: About.name,
    builder: (context, state) => const About(),
  ),
  GoRoute(
    path: SearchPageScreen.path,
    name: SearchPageScreen.name,
    builder: (context, state) => SearchPageScreen(),
  ),
  GoRoute(
    path: GetTeacherProfileBeforeCompleteScreen.path,
    name: GetTeacherProfileBeforeCompleteScreen.name,
    builder: (context, state) => const GetTeacherProfileBeforeCompleteScreen(),
  ),
  GoRoute(
    path: TeacherLogInScreen.path,
    name: TeacherLogInScreen.name,
    builder: (context, state) => const TeacherLogInScreen(),
  ),
  GoRoute(
    path: NavBarScreen.path,
    name: NavBarScreen.name,
    builder: (context, state) => const NavBarScreen(),
  ),
  GoRoute(
    path: TeacherRegisterScreen.path,
    name: TeacherRegisterScreen.name,
    builder: (context, state) => const TeacherRegisterScreen(),
  ),
  GoRoute(
    path: ChooseMajor.path,
    name: ChooseMajor.name,
    builder: (context, state) => const ChooseMajor(),
  ),
  GoRoute(
    path: CompleteRegister.path,
    name: CompleteRegister.name,
    builder: (context, state) => const CompleteRegister(),
  ),
  GoRoute(
    path: CompleteInfo.path,
    name: CompleteInfo.name,
    builder: (context, state) => const CompleteInfo(),
  ),
  GoRoute(
    path: StudentHomePage.path,
    name: StudentHomePage.name,
    builder: (context, state) {
      return const StudentHomePage();
    },
  ),
  GoRoute(
    path: Conditions.path,
    name: Conditions.name,
    builder: (context, state) {
      return const Conditions();
    },
  ),
  GoRoute(
    path: CheckYourPhone.path,
    name: CheckYourPhone.name,
    builder: (context, state) => const CheckYourPhone(),
  ),
  GoRoute(
    path: PutPhoneNumberScreen.path,
    name: PutPhoneNumberScreen.name,
    builder: (context, state) => const PutPhoneNumberScreen(),
  ),
  GoRoute(
    path: TeachersProfileStudent.path,
    name: TeachersProfileStudent.name,
    builder: (context, state) {
      final userId = state.uri.queryParameters['id'] ?? "";

      return TeachersProfileStudent(
        userId: userId,
      );
    },
  ),
  GoRoute(
    path: NotificationScreen.path,
    name: NotificationScreen.name,
    builder: (context, state) => const NotificationScreen(),
  ),
  GoRoute(
    path: AllSubjectsForStudent.path,
    name: AllSubjectsForStudent.name,
    builder: (context, state) => const AllSubjectsForStudent(),
  ),
  GoRoute(
    path: FilterPage.path,
    name: FilterPage.name,
    builder: (context, state) => FilterPage(),
  ),
  GoRoute(
      path: FilterdTeachers.path,
      name: FilterdTeachers.name,
      builder: (context, state) {
        final genderName = state.uri.queryParameters['genderName'] ?? "";

        Map<String, dynamic> args = state.extra as Map<String, dynamic>;
        return FilterdTeachers(
          subjectIds: args["subjectIds"] != null
              ? args["subjectIds"] as List<String>
              : [],
          locationIds: args["locationIds"] != null
              ? args["locationIds"] as List<String>
              : [],
          academicLevelIds: args["academicLevelIds"] != null
              ? args["academicLevelIds"] as List<String>
              : [],
          genderName: genderName,
        );
      }),
  GoRoute(
    path: StudentNavBarScreen.path,
    name: StudentNavBarScreen.name,
    builder: (context, state) => const StudentNavBarScreen(),
  ),
  GoRoute(
    path: StudentLoginScreen.path,
    name: StudentLoginScreen.name,
    builder: (context, state) => const StudentLoginScreen(),
  ),

  GoRoute(
    path: StudentSettingsUi.path,
    name: StudentSettingsUi.name,
    builder: (context, state) => const StudentSettingsUi(),
  ),
  GoRoute(
    path: WhoWeAre.path,
    name: WhoWeAre.name,
    builder: (context, state) => const WhoWeAre(),
  ),
  GoRoute(
    path: ContactUsScreen.path,
    name: ContactUsScreen.name,
    builder: (context, state) => const ContactUsScreen(),
  ),
  GoRoute(
    path: ActivateScreen.path,
    name: ActivateScreen.name,
    builder: (context, state) => const ActivateScreen(),
  ),
  GoRoute(
    path: AboutTeacher.path,
    name: AboutTeacher.name,
    builder: (context, state) => const AboutTeacher(),
  ),
  GoRoute(
    path: EditTeacherProfile.path,
    name: EditTeacherProfile.name,
    builder: (context, state) => const EditTeacherProfile(),
  ),
  GoRoute(
    path: ContactUsTeacherScreen.path,
    name: ContactUsTeacherScreen.name,
    builder: (context, state) => const ContactUsTeacherScreen(),
  ),
  GoRoute(
    path: UpdateVersion.path,
    name: UpdateVersion.name,
    builder: (context, state) => const UpdateVersion(),
  ),
  GoRoute(
    path: WhoWeAreTeacher.path,
    name: WhoWeAreTeacher.name,
    builder: (context, state) => const WhoWeAreTeacher(),
  ),
  // GoRoute(
  //   path: BeforeEditProfile.path,
  //   name: BeforeEditProfile.name,
  //   builder: (context, state) => const BeforeEditProfile(),
  // ),
  GoRoute(
    path: TopTeachersBySub.path,
    name: TopTeachersBySub.name,
    builder: (context, state) {
      final subId = state.uri.queryParameters['subjectIds'] ?? "";
      final userId = state.uri.queryParameters['id'] ?? "";
      return TopTeachersBySub(
        subId: subId,
        userId: userId,
      );
    },
  ),
]);
