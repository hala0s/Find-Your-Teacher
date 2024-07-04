import 'package:find_your_teacher/features/teacher_home/presentation/pages/edit_profile/teacher_edit_profile.dart';
import 'package:find_your_teacher/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'circle_profile_photo.dart';

class BuildTeacherCover extends StatelessWidget {
  const BuildTeacherCover({
    Key? key,
    required this.name,
    required this.photo,
  }) : super(key: key);

  final String name;
  final String photo;

  @override
  Widget build(BuildContext context) {
    const collapsedHeight = 65.0;
    return Stack(
      alignment: Alignment.topCenter,
        children: [
      SizedBox(
        height: 300.h,
        width: 380.w,
        child: Image.asset(
          Images.profileBackground,
          fit: BoxFit.cover,
        ),
      ),
      CircleProfile(
        collapsedHeight: collapsedHeight,
        photo: photo,
      ),
      PositionedDirectional(
        top: 130.h,
        start: 130.w,
        child: Text(name, style: TextStyle(color: Colors.white)),
      ),
      PositionedDirectional(
        bottom: 60.h,
        end: 10.w,
        child: ElevatedButton(
          onPressed: () {
            context.pushNamed(EditTeacherProfile.name);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent.withOpacity(0.2),
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            shadowColor: Colors.transparent,
          ),
          child: Text("تعديل الملف الشخصي"),
        ),
      ),
    ]);
  }
}
