import 'package:find_your_teacher/core/bloc/app_state_bloc.dart';
import 'package:find_your_teacher/features/notfications/presentation/widgets/bloc_state_data_builder.dart';
import 'package:find_your_teacher/features/search%20and%20filter/presentation/manager/search_with_filter/search_and_filter_bloc.dart';
import 'package:find_your_teacher/features/student_home/presentation/manager/top_teachers/top_teachers_bloc.dart';
import 'package:find_your_teacher/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_routes.dart';
import '../../../../resources/resources.dart';
import '../../../student_home/data/models/teacher_by_user_id_model.dart';
import '../../../student_home/presentation/pages/teacher_profile_student.dart';
import '../../../student_home/presentation/widgets/teacher_card.dart';
import '../../data/models/teachers_after_filter_model.dart';

class TeachersAfterFilter extends StatelessWidget {
  const TeachersAfterFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
 value: getIt<TopTeachersBloc>(),
  child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            elevation: 0,
            color: Theme.of(context).colorScheme.background,
            child: Padding(
              padding: REdgeInsets.all(12),
              child: BlocSelector<SearchAndFilterBloc, SearchAndFilterState,
                  BlocStateData<TeacherAfterFilterModel>>(
                selector: (state) => state.filterState,
                builder: (context, state) {

                  return BlocStateDataBuilder(
                      data: state,
                      onFailed: const Text("there's no filterd teachers"),
                      onSuccess: (data) {
                        if (state.data?.users == null || state.data!.users.isEmpty) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(Images.noResults),
                              SizedBox(height: 20.h,),
                              Center(child: Text("لايوجد أساتذة")),
                            ],
                          );
                        }
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: data?.users.length,
                                itemBuilder: (context, index) {
                                  final teacherName =
                                      data?.users[index].userName ?? "";
                                  final teacherLocation =
                                      data?.users[index].locationsName ?? [];
                                  final subject =
                                      data?.users[index].subjectName ?? [];
                                  final img =
                                      data?.users[index].profilePhoto.url ??
                                          "";
                                  final userId =
                                      data?.users[index].userId ?? "";
                                  return TeachersCard(
                                    teacherName: teacherName,
                                    location: teacherLocation.isNotEmpty ? teacherLocation[0] : "",
                                    subject: subject.isNotEmpty ? subject[0] : "",
                                    img: img,
                                    onPressed: () {
                                      context
                                          .read<TopTeachersBloc>()
                                          .add(TopTeachersByIdEvent(
                                              userId: userId,
                                              onSuccess: () {
                                                router.pushNamed(
                                                    TeachersProfileStudent
                                                        .name,
                                                    queryParameters: {
                                                      "id": userId
                                                    });
                                              }));
                                    },
                                  );
                                }),
                          );
                      });
                },
              ),
            ))),
);
  }
}

