
import 'package:find_your_teacher/core/bloc/app_state_bloc.dart';
import 'package:find_your_teacher/core/theme/colors.dart';
import 'package:find_your_teacher/features/notfications/presentation/widgets/bloc_state_data_builder.dart';
import 'package:find_your_teacher/features/student_home/data/models/top_teachers_model.dart';
import 'package:find_your_teacher/features/student_home/presentation/manager/top_teachers/top_teachers_bloc.dart';
import 'package:find_your_teacher/injection/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_routes.dart';
import '../../../student_home/presentation/pages/teacher_profile_student.dart';
import '../widgets/teacher_card.dart';

class TopTeachers extends StatelessWidget {
  const TopTeachers({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<TopTeachersBloc>()..add(GetTopTeachersEvent()),
      child: BlocSelector<TopTeachersBloc, TopTeachersState,
          BlocStateData<TopTeachersModel>>(
        selector: (state) => state.topTeachersState,
        builder: (context, state) {
          return BlocStateDataBuilder(
              data: state,
              onFailed: Center(child: Text(" no internet connection")),
              onSuccess: (data) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 350.w,
                      height: 430.h,
                      child: Animate(
                        effects: const [
                          ScaleEffect()
                        ],
                        child: ListView.builder(
                            shrinkWrap: false,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              final teacherName =
                                  data?.users[index].userName ?? "";
                              final teacherLocation =
                                  data?.users[index].locationsName ?? [];
                              final subject =
                                  data?.users[index].subjectName ?? [];
                              final img =
                                  data?.users[index].profilePhoto.url ?? "";
                              final userId = data?.users[index].userId ?? "";
                              return TeachersCard(
                                  teacherName: teacherName,
                                location: teacherLocation.isNotEmpty ? teacherLocation[0] : "",
                                subject: subject.isNotEmpty ? subject[0] : "",
                                  img: img, onPressed: () { context
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
                            }
                            ).animate().scale(duration: 100.ms),
                      ),
                    ),
                  ));
        },
      ),
    );
  }
}


