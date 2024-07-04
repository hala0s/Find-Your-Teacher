import 'package:find_your_teacher/features/teacher%20auth/presentation/pages/complete_register_1.dart';
import 'package:find_your_teacher/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/my_button.dart';
import '../../../../resources/resources.dart';
import '../manager/get_teacher_profile_before_complete_/get_teacher_profile_before_complete_bloc.dart';

class GetTeacherProfileBeforeCompleteScreen extends StatefulWidget {
  static String name = "get_profile_teacher_before_complete_screen";
  static String path = "/get_profile_teacher_before_complete_screen";

  const GetTeacherProfileBeforeCompleteScreen({super.key});

  @override
  State<GetTeacherProfileBeforeCompleteScreen> createState() =>
      _GetTeacherProfileBeforeCompleteScreenState();
}

class _GetTeacherProfileBeforeCompleteScreenState
    extends State<GetTeacherProfileBeforeCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<GetTeacherProfileBeforeCompleteBloc>()
        ..add(GetTeacherProfileBeforeCompleteE()),
      child: Scaffold(
        body: BlocBuilder<GetTeacherProfileBeforeCompleteBloc,
            GetTeacherProfileBeforeCompleteState>(builder: (context, state) {
          if (state is GetTeacherProfileBeforeCompleteLoadingState)
            return Center(
              child: Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            );
          else if (state is GetTeacherProfileBeforeCompleteSuccessState) {

            return Padding(
              padding: const EdgeInsets.all(14.0),
              child: ListView(

                  children: [
                SizedBox(
                  height: 35.h,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: REdgeInsets.only(left: 50),
                    child: Text("مرحبا ",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: lightColorScheme.primary)),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    child: Text(state.getTeacherProfileEntities.userName,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                    margin: REdgeInsets.only(left: 20),
                    height: 300.h,
                    width: 300.w,
                    child: Lottie.asset(
                     "assets/images/84FGRH5ryX.json",
                      height: 130.h,
                      width: 130.w,
                    )),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 115.h,
                      width: 115.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        // color: Colors.grey,
                      ),
                      child: const CircleAvatar(
                        radius: 55,
                        backgroundImage: NetworkImage(
                            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                      ),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 9.w),
                            child: Text(
                                state.getTeacherProfileEntities.userName,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(color: Colors.black))),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(state.getTeacherProfileEntities.phoneNumber,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    color:
                                        lightColorScheme.onSecondaryContainer))
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Center(
                  child: Text('يرجى  اكمال المعلومات ...',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: Colors.black)),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50.0,left: 50.0),
                  child: MainButton(
                      text: 'اكمال تسجيل الدخول',
                      backgroundColor: lightColorScheme.onSecondaryContainer,
                      size: Size(213.w, 50.h),
                      onPressed: () =>
                          context.pushNamed(CompleteRegister.name)),
                ),
              ]),
            );
          } else if (state is GetTeacherProfileBeforeCompleteFailState) {
            return Center(child: Text("Feild to load data try again"));
          }
          return Center(
            child: CircularProgressIndicator(
              color: Colors.purple,
            ),
          );
        }),
      ),
    );
  }
}

