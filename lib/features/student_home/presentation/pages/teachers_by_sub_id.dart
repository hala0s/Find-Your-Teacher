import 'package:find_your_teacher/features/student_home/presentation/widgets/teachers_by_subject_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../injection/injection.dart';
import '../manager/student_profile/student_profile_bloc.dart';
import '../manager/top_teachers/top_teachers_bloc.dart';
import '../widgets/covers.dart';

class TopTeachersBySub extends StatelessWidget {
  const TopTeachersBySub({super.key, required this.subId, required this.userId});
  static String name = "teachers_by_id";
  static String path = "/teachers_by_id";
final String subId;
final String userId;
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<StudentProfileBloc>()
            ..add(GetTeacherBySubEvent(subjectId: subId, onSuccess: () {}))
        ),
        BlocProvider.value(
          value: getIt<TopTeachersBloc>(),
        ),
      ],
  child: Scaffold(
        body: Column(
          children: [
            Builder(
              builder: (context) {
                return StudentCover();
              }
            ),
            Expanded(
              child: ListView(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "معلمين المادة",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(width: 60.w),

                    ],
                  ),
                  TeacherById(subId: subId, userId: userId,),
                ],
              ),
            ),
          ],
        )),
);
  }
}
