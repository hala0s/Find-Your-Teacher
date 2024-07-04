import 'package:find_your_teacher/features/student_home/presentation/widgets/subjects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/bloc/app_state_bloc.dart';
import '../../../notfications/presentation/widgets/bloc_state_data_builder.dart';
import '../../data/models/teacher_by_user_id_model.dart';
import '../manager/top_teachers/top_teachers_bloc.dart';
import 'locations.dart';

class TeacherProfileContent extends StatelessWidget {
  const TeacherProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TopTeachersBloc, TopTeachersState,
        BlocStateData<TeacherByUserIdModel>>(
      selector: (state) => state.topTeachersByIdState,
      builder: (context, state) {
        final aboutMe = (state.data?.user.aboutMe ?? "");
        return BlocStateDataBuilder(
          data: state,
          onFailed: Text("failed to load user profile"),
          onSuccess: (data) => Padding(
            padding: REdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: REdgeInsets.symmetric(horizontal: 10.0),
              children: [
                Padding(
                  padding: REdgeInsets.only(right: 25.0),
                  child: Text(
                    "حول",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  margin: REdgeInsets.all(15.0),
                  padding: REdgeInsets.all(15.0),
                  width: 340.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.white,
                  ),

                  child:     Text(
                        aboutMe,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),

                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: REdgeInsets.only(right: 25.0),
                  child: Text("المواد"),
                ),
                Subjectss(),
                SizedBox(height: 15.h),
                Padding(
                  padding: REdgeInsets.only(right: 25.0),
                  child: Text("المناطق"),
                ),

                TeacherLocation(),
              ],
            ),
          ),
        );
      },
    );
  }
}
