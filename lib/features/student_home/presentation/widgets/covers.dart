import 'package:find_your_teacher/core/bloc/app_state_bloc.dart';
import 'package:find_your_teacher/core/theme/colors.dart';
import 'package:find_your_teacher/features/notfications/presentation/widgets/bloc_state_data_builder.dart';
import 'package:find_your_teacher/features/student_home/data/models/student_profile_model.dart';
import 'package:find_your_teacher/features/student_home/data/models/take_number_model.dart';
import 'package:find_your_teacher/features/student_home/presentation/manager/student_profile/student_profile_bloc.dart';
import 'package:find_your_teacher/features/student_home/presentation/manager/take_teacher_number/take_teacher_number_bloc.dart';
import 'package:find_your_teacher/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../../core/widgets/textformfeild.dart';
import '../../../teacher_home/presentation/widgets/circle_profile_photo.dart';

class StudentCover extends StatefulWidget {
  const StudentCover({super.key});

  @override
  State<StudentCover> createState() => _StudentCoverState();
}

class _StudentCoverState extends State<StudentCover> {
  Future<void> _refresh(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    context.read<StudentProfileBloc>()
      .add(GetStudentProfileEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return RefreshIndicator(
          onRefresh: () => _refresh(context),
          child: SizedBox(
              height: 250.h,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned.directional(
                    bottom: 10.h,
                    height: 200.h,
                    width: 1.sw,
                    textDirection: TextDirection.rtl,
                    child: Transform.scale(
                      scale: 1.25,
                      child: Image.asset(
                        "assets/images/profile_background.png",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  BlocSelector<StudentProfileBloc, StudentProfileState,
                      BlocStateData<StudentProfileModel>>(
                    selector: (state) => state.profileState,
                    builder: (context, state) {
                      return BlocStateDataBuilder(
                        onLoading: Text(""),
                        data: state,
                        onFailed: Text("failed to load "),
                        onSuccess: (data) {
                          return PositionedDirectional(
                              top: 80,
                              end: 23,
                              child: Animate(
                                effects: [FadeEffect()],
                                child: Container(
                                  width: 50,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: lightColorScheme.onSurface,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: REdgeInsets.only(left: 5.0, right: 5.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: REdgeInsets.only(right: 2.5),
                                          child: Text("${state.data?.count}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                      color:
                                                          lightColorScheme.onPrimary)),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Padding(
                                          padding: REdgeInsets.only(right: 5.0),
                                          child: const Icon(
                                            PhosphorIconsBold.coins,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ],
                                    ).animate().scale(duration: 100.ms),
                                  ),
                                ),
                              ));
                        },
                      );
                    },
                  ),
                  PositionedDirectional(
                      start: 30.w,
                      top: 80.h,
                      child: Text(
                        "جد",
                        style: Theme.of(context).textTheme.titleSmall,
                      )
                          .animate()
                          .fadeIn(duration: 600.ms)
                          .then(delay: 200.ms) // baseline=800ms
                          .slide()),
                  PositionedDirectional(
                    start: 30.w,
                    top: 95.h,
                    child: Text(
                      "معلمك",
                      style: Theme.of(context).textTheme.titleLarge,
                    )
                        .animate()
                        .fadeIn(duration: 600.ms)
                        .then(delay: 200.ms) // baseline=800ms
                        .slide(),
                  ),
                  Positioned(bottom: 38.w, left: 10.h, child: StudentSearchBar()),

                ],
              ),
            ),
        );
      }
    );
  }
}

class TeacherCoverToStudent extends StatelessWidget {
  const TeacherCoverToStudent({
    super.key,
    required this.teacherName,
    required this.img,
    required this.userId,
  });
  final String teacherName;
  final String img;
  final String userId;

  @override
  Widget build(BuildContext context) {
    const collapsedHeight = 65.0;
    return BlocProvider.value(
      value: getIt<TakeTeacherNumberBloc>(),
      child: Stack(
        children: [
          SizedBox(
            height: 300.h,
            width: 390.w,
            child: Image.asset(
              "assets/images/profile_background.png",
              fit: BoxFit.cover,
            ),
          ),
          CircleProfile(
            collapsedHeight: collapsedHeight,
            photo: img,
          ),
          PositionedDirectional(
            top: 110.h,
            start: 138.w,
            child: Text(teacherName, style: const TextStyle(color: Colors.white)),
          ),
          BlocSelector<TakeTeacherNumberBloc, TakeTeacherNumberState,
              BlocStateData<TakeNumberModel>>(
            selector: (state) => state.takeNumberState,
            builder: (context, state) {
              return PositionedDirectional(
                top: 140.h,
                start: 130.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.onSurface,
                  ),
                  onPressed: () {
                    context.read<TakeTeacherNumberBloc>().add(
                      TakeTeacherNumberEvent(
                        userId: userId,
                        onSuccess: () {
                          Future.microtask(() {
                            final message = context.read<TakeTeacherNumberBloc>().state.takeNumberState.data?.message ?? "No message";
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Center(
                                    child: Text(
                                      message,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                          color: lightColorScheme.secondary),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("اوك"),
                                    ),
                                  ],
                                );
                              },
                            );
                          });
                        },
                      ),
                    );
                  },
                  child: Text(
                    "أخذ الرقم",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: lightColorScheme.onPrimary),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
