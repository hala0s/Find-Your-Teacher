import 'package:find_your_teacher/features/student_home/presentation/manager/student_profile/student_profile_bloc.dart';
import 'package:find_your_teacher/features/student_home/presentation/pages/all_subjects.dart';
import 'package:find_your_teacher/features/student_home/presentation/pages/top_teachers.dart';
import 'package:find_your_teacher/features/student_home/presentation/pages/top_teachers2.dart';
import 'package:find_your_teacher/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/bloc/app_state_bloc.dart';
import '../../data/models/student_profile_model.dart';
import '../widgets/covers.dart';
import '../widgets/subject_boxes.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({
    super.key,
  });

  static String name = "student_home";
  static String path = "/student_home";

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  Future<void> _refresh(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    context.read<StudentProfileBloc>()
      ..add(GetStudentSubjectsEvent())
      ..add(GetStudentProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StudentProfileBloc>()
        ..add(GetStudentSubjectsEvent())
        ..add(GetStudentProfileEvent()),
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return RefreshIndicator(
              onRefresh: () => _refresh(context),
              child: Column(
                children: [
                  StudentCover(),
                  Expanded(
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: REdgeInsetsDirectional.only(start: 20),
                              child: Text(
                                "المادة",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            SizedBox(width: 80.w),
                            Container(
                              margin: REdgeInsetsDirectional.only(start: 100),
                              child: GestureDetector(
                                onTap: () {
                                  context.pushNamed(AllSubjectsForStudent.name);
                                },
                                child: Text(
                                  "رؤية الكل",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            ),
                            SizedBox(height: 15.h),
                          ],
                        ),
                        const SubjectsForStudent(),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: REdgeInsetsDirectional.only(start: 20),
                              child: Text(
                                "الأكثر طلبا",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            SizedBox(width: 60.w),
                            TextButton(
                              onPressed: () {
                                context.pushNamed(TopTeachers2.name);
                              },
                              child: Container(
                                margin: REdgeInsetsDirectional.only(start: 100),
                                child: Text(
                                  "رؤية الكل",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),
                          ],
                        ),
                        TopTeachers(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
