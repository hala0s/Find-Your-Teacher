import 'package:find_your_teacher/features/notfications/presentation/widgets/bloc_state_data_builder.dart';
import 'package:find_your_teacher/features/student_home/presentation/pages/teacher_settings.dart';
import 'package:find_your_teacher/features/teacher_home/presentation/pages/edit_profile/teacher_edit_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/bloc/app_state_bloc.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../injection/injection.dart';
import '../../../../../resources/resources.dart';
import '../../../../teacher auth/presentation/pages/complete_register2.dart';
import '../../../data/models/profile_model.dart';
import '../../manager/get_teacher_profile_bloc.dart';
import '../../widgets/edit_profile1.dart';


class BeforeEditProfile extends StatelessWidget {
  static String name = "before_edit_profile";
  static String path = "/before_edit_profile";

  const BeforeEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider.value(
            value: getIt<GetTeacherProfileBloc>()
              ..add(GetTeacherProfileE()),
            child: BlocSelector<GetTeacherProfileBloc, GetTeacherProfileState,
                BlocStateData<TeacherProfileModel>>(
              selector: (state) => state.teacherProfile,
              builder: (context, state) {
                return Scaffold(
                  body: BlocStateDataBuilder(
                    data: state,
                    onSuccess: (data) => ListView(children: [
                      Column(children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Container(
                          child: Text('تعديل الملف الشخصي',style: Theme.of(context).textTheme.bodyLarge,),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        EditProfileCard(
                          body: data?.user.aboutMe ?? " ",
                          title: 'حول', photo: Images.aboutMeIcon,
                        ),

                        SizedBox(
                          height: 13.h,
                        ),
                        EditProfileCard(
                          body: data?.user.subjectName.join('') ?? "",
                          title: 'المواد', photo: Images.subjectIcon,
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        EditProfileCard(
                          body: data?.user.locationsName.join('') ?? "",
                          title: 'المنطقة', photo: Images.locationIcon,
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        EditProfileCard2(
                          body: data?.user.price ?? 0,
                          title: 'سعر الجلسة',
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        GestureDetector(
                          onTap: (){ context.pushNamed(TeacherEditInfo.name) ;},
                          child: SizedBox(
                            width: 200.w,
                            child: Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: lightColorScheme.primary,
                              ),
                              child: Center(
                                child: Text("تعديل الملف ", style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        )
                      ]),
                    ]),
                    onFailed: Text("feild to load data"),
                  ),
                );
              },
            )));
  }
}
