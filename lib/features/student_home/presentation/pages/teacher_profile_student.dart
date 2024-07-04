import 'package:find_your_teacher/core/bloc/app_state_bloc.dart';
import 'package:find_your_teacher/features/student_home/data/models/teacher_by_user_id_model.dart';
import 'package:find_your_teacher/features/student_home/presentation/manager/top_teachers/top_teachers_bloc.dart';
import 'package:find_your_teacher/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/covers.dart';
import '../widgets/teacher_profile_content.dart';

class TeachersProfileStudent extends StatelessWidget {
  const TeachersProfileStudent({Key? key, required this.userId})
      : super(key: key);
  static String name = "teacher_profile_student";
  static String path = "/teacher_profile_student";
  final String userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<TopTeachersBloc>()
        ..add(TopTeachersByIdEvent(userId: userId, onSuccess: () {})),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocSelector<TopTeachersBloc, TopTeachersState,
                  BlocStateData<TeacherByUserIdModel>>(
                selector: (state) => state.topTeachersByIdState,
                builder: (context, state) {
                  final name = state.data?.user.userName ?? "";
                  final userImage = state.data?.user.profilePhoto.url ?? "";
                  return TeacherCoverToStudent(
                    teacherName: name,
                    img: (userImage),
                    userId: userId,
                  );
                },
              ),
              TeacherProfileContent(),
            ],
          ),
        ),
      ),
    );
  }
}

