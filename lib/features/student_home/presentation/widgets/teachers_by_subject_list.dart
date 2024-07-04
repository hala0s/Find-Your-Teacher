import 'package:find_your_teacher/core/bloc/app_state_bloc.dart';
import 'package:find_your_teacher/features/notfications/presentation/widgets/bloc_state_data_builder.dart';
import 'package:find_your_teacher/features/student_home/presentation/manager/student_profile/student_profile_bloc.dart';
import 'package:find_your_teacher/features/student_home/presentation/pages/all_top_teachers.dart';
import 'package:find_your_teacher/features/student_home/presentation/widgets/teacher_card.dart';
import 'package:find_your_teacher/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_routes.dart';
import '../../data/models/teacher_by_sub_id_model.dart';
import '../manager/top_teachers/top_teachers_bloc.dart';
import '../pages/teacher_profile_student.dart';

class TeacherById extends StatelessWidget {
  TeacherById({Key? key, required this.subId, required this.userId})
      : super(key: key);
  final String subId;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return  BlocSelector<StudentProfileBloc, StudentProfileState,
          BlocStateData<TeacherByIdModel>>(
        selector: (state) => state.studentProfileState,
        builder: (context, state) {
          return BlocStateDataBuilder(
              data: state,
              onFailed: Text("there's no top teachers"),
              onSuccess: (data) {
                if (state.data?.users == null || state.data!.users.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(child: Text("لايوجد أساتذة")),
                    ],
                  );
                }
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.data?.users.length,
                      itemBuilder: (context, index) {
                        final teacherName = data?.users[index].userName ?? "";
                        final teacherLocation =
                            data?.users[index].locationsName ?? [];
                        final subject = data?.users[index].subjectName ?? [];
                        final img = data?.users[index].profilePhoto.url ?? "";
                        final userId = data?.users[index].userId ?? "";
                        return TeachersCard(
                          teacherName: teacherName,
                          location: teacherLocation.isNotEmpty
                              ? teacherLocation[0]
                              : "",
                          subject: subject.isNotEmpty ? subject[0] : "",
                          img: img,
                          onPressed: () {
                            context
                                .read<TopTeachersBloc>()
                                .add(TopTeachersByIdEvent(
                                    userId: userId,
                                    onSuccess: () {
                                      router.pushNamed(
                                          TeachersProfileStudent.name,
                                          queryParameters: {"id": userId});
                                    }));
                          },
                        );
                      }),
                );
              });
        },
    );
  }
}
