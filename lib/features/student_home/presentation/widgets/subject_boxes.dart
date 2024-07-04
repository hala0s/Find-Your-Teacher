import 'package:find_your_teacher/core/bloc/app_state_bloc.dart';
import 'package:find_your_teacher/features/notfications/presentation/widgets/bloc_state_data_builder.dart';
import 'package:find_your_teacher/features/student_home/data/models/student_subjetcs_model.dart';
import 'package:find_your_teacher/features/student_home/data/models/teacher_by_sub_id_model.dart';
import 'package:find_your_teacher/features/student_home/presentation/manager/student_profile/student_profile_bloc.dart';
import 'package:find_your_teacher/features/student_home/presentation/pages/teachers_by_sub_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/colors.dart';
import 'icon_styles.dart';

class SubjectsForStudent extends StatefulWidget {
  const SubjectsForStudent({super.key});

  @override
  State<SubjectsForStudent> createState() => _SubjectsForStudentState();
}


class _SubjectsForStudentState extends State<SubjectsForStudent> {

  @override
  Widget build(BuildContext context) {
    return BlocSelector<StudentProfileBloc, StudentProfileState,
        BlocStateData<GetStudentSubjectsModel>>(
      selector: (state) => state.subjectsState,
      builder: (context, state) {
        return BlocStateDataBuilder(
          data: state,
          onFailed: Center(child: Text(" no internet connection")),
          onSuccess: (data) {
            return Animate(
              effects: const [
                FadeEffect(),
              ],
              child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 0,
                crossAxisSpacing: 1.w,
                childAspectRatio: (5.w / 5.7.h),
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                final subjects = state.data?.subjects[index].name ?? "";
                final teachersCount = state.data?.subjects[index].users.length;
                final subId= data?.subjects[index].id??"";
                return Padding(
                  padding: REdgeInsets.fromLTRB(10, 10, 10, 5),
                  child: BlocSelector<StudentProfileBloc, StudentProfileState,
                      BlocStateData<TeacherByIdModel>>(
                    selector: (state) => state.studentProfileState,
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          context.read<StudentProfileBloc>().add(GetTeacherBySubEvent(
                              subjectId: subId, onSuccess: (){
                                context.pushNamed(TopTeachersBySub.name,queryParameters: {
                                  "subjectIds": subId,
                                });
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: lightColorScheme.onPrimary,
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: REdgeInsetsDirectional.fromSTEB(
                                      20, 5, 0, 0),
                                  child: CircleIcons(
                                    image:
                                        data?.subjects[index].subjectImage.url ??
                                            "",
                                  ),
                                ),
                                Text(
                                  subjects,
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text("$teachersCount  أستاذ",
                                    style: Theme.of(context).textTheme.bodySmall)
                              ]),
                        ),
                      );
                    },
                  ),
                );
              },
                        ).animate().scale(duration: 100.ms),

            );
          },
        );
      },
    );
  }
}
