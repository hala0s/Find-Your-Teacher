import "package:find_your_teacher/core/theme/colors.dart";
import "package:find_your_teacher/features/teacher%20auth/presentation/manager/second_complete_profile/second_complete_profile_bloc.dart";
import "package:find_your_teacher/features/teacher%20auth/presentation/pages/complete_register_info.dart";
import "package:find_your_teacher/injection/injection.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:go_router/go_router.dart";

class TeacherEditProfile extends StatefulWidget {
  const TeacherEditProfile(
      {super.key, required this.aboutMe, required this.price});
  static String name = "edit_profile_teacher";
  static String path = "/edit_profile_teacher";
  final String aboutMe;
  final int price;

  @override
  State<TeacherEditProfile> createState() => _TeacherEditProfileState();
}

class _TeacherEditProfileState extends State<TeacherEditProfile> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<SecondCompleteProfileBloc>()..add(GetSecondProfileEvent()),
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: lightColorScheme.secondary,
            onPressed: () {
              context.pop();
            },
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 30.h),
            Text(
              "تعديل المعلومات",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: 50.h,
            ),
            Expanded(
                child: EditRegisterInfo(
              aboutMe: widget.aboutMe,
              price: widget.price,
            )),
          ],
        ),
      )),
    );
  }
}
