import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/bloc/app_state_bloc.dart';
import '../../../../core/theme/colors.dart';
import '../../../notfications/presentation/widgets/bloc_state_data_builder.dart';
import '../../../student_home/presentation/widgets/icon_styles.dart';
import '../../data/models/profile_model.dart';
import '../manager/get_teacher_profile_bloc.dart';

class SubjectsTeacher extends StatelessWidget {
  final List<String> subjects;
  const SubjectsTeacher({
    super.key, required this.subjects,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<GetTeacherProfileBloc, GetTeacherProfileState,
        BlocStateData<TeacherProfileModel>>(
      selector: (state) => state.teacherProfile,
      builder: (context, state) {
        return BlocStateDataBuilder(
          data: state,
          onFailed: const Text("Failed to load data"),
          onSuccess: (data) {
            if (state.data?.user.subjectName == null || state.data!.user.subjectName.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [

                  SizedBox(height: 20.h,),
                  const Center(child: Text("لم يتم وضع مواد ")),
                ],
              );
            }
            return GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 1.w,
                childAspectRatio: (3.w / 2.3.h),
              ),
              itemCount: state.data?.user.subjectName.length,
              itemBuilder: (context, index) {
                final subjects = state.data?.user.subjectName[index];
                return Padding(
                    padding: REdgeInsets.fromLTRB(10, 0, 10, 5),
                    child: Container(
                      // height: 50.h,
                      //   width: 50.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: lightColorScheme.onPrimary,
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SubCircleIcons(
                                icon: PhosphorIconsBold.books,
                                width: 50,
                                height: 50,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                subjects ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontSize: 14),
                              ),
                            ])));
              });
          },
        );
      },
    );
  }
}
