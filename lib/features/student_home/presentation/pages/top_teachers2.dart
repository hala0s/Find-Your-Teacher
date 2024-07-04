import 'dart:ffi';

import 'package:find_your_teacher/features/student_home/presentation/manager/student_profile/student_profile_bloc.dart';
import 'package:find_your_teacher/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/covers.dart';
import 'all_top_teachers.dart';

class TopTeachers2 extends StatelessWidget {
  const TopTeachers2({Key? key}) : super(key: key);
  static String name = "top_teachers2";
  static String path = "/top_teachers2";
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
  value: getIt<StudentProfileBloc>()..add(GetStudentProfileEvent()),
  child: Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          StudentCover(),
          Expanded(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "المعلمين الرائجين",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(width: 60.w),
                  ],
                ),
                const AllTopTeachers(),
              ],
            ),
          ),
        ],
      ),
    ),
);
  }
}
