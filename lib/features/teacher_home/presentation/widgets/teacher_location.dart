import 'package:find_your_teacher/core/bloc/app_state_bloc.dart';
import 'package:find_your_teacher/features/notfications/presentation/widgets/bloc_state_data_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../../core/theme/colors.dart';
import '../../../student_home/presentation/widgets/icon_styles.dart';
import '../../../teacher_home/data/models/profile_model.dart';
import '../../../teacher_home/presentation/manager/get_teacher_profile_bloc.dart';

class LocationForTeacher extends StatelessWidget {
  const LocationForTeacher({
    super.key, required this.locations,
  });
final List<String> locations ;
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
            if (state.data?.user.locationsName == null || state.data!.user.locationsName.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [

                  SizedBox(height: 20.h,),
                  const Center(child: Text("لم يتم وضع مناطق ")),
                ],
              );
            }
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 1.w,
                childAspectRatio: (5.w / 2.3.h),
              ),
              itemCount: state.data?.user.locationsName.length,
              itemBuilder: (context, index) {
                final location = state.data?.user.locationsName[index];
                return Padding(
                    padding: REdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: lightColorScheme.onPrimary,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SubCircleIcons(
                                  icon: PhosphorIconsBold.mapPin,
                                  width: 35,
                                  height: 35,
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Flexible(
                                    fit: FlexFit.tight,
                                    child: Text(
                                      location ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(fontSize: 14),
                                    )),
                              ]),
                        )));
              });
          },
        );
      },
    );
  }
}
