import 'package:find_your_teacher/core/theme/colors.dart';
import 'package:find_your_teacher/features/student_auth/presentation/pages/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../resources/resources.dart';
import '../../../teacher auth/presentation/pages/sign_up_teacher_screen.dart';

class ChooseMajor extends StatelessWidget {
  const ChooseMajor({super.key});
  static String name = "choose_major_screen";
  static String path = "/choose_major_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 200.h,
              ),
              Text(
                'اختر تخصصك من فضلك',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 90.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: REdgeInsets.only(top: 60.0, ),
                        child: GestureDetector(
                          onTap: () {
                            context.pushNamed(TeacherRegisterScreen.name);
                          },
                          child: Padding(
                            padding:  REdgeInsets.only(right: 10.0),
                            child: Container(
                              width: 140.w,
                              height: 130.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: lightColorScheme.onSurface
                                      .withOpacity(0.3)),
                              child: Padding(
                                padding: REdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  Images.teacherLast,
                                  height: 120.h,
                                  width: 80.w,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ElevatedButton(
                          onPressed: () =>
                              context.pushNamed(TeacherRegisterScreen.name),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: lightColorScheme.background,
                              fixedSize: Size(100.w, 50.h)),
                          child: Text('معلم',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      fontSize: 20,
                                      color: lightColorScheme.secondary))),
                    ],
                  ),
                  SizedBox(
                    width: 20.w,
                  ), // Added SizedBox for spacing
                  Column(
                    children: [
                      Padding(
                        padding: REdgeInsets.only(top: 60.0, ),
                        child: GestureDetector(
                          onTap: () {
                            context.pushNamed(StudentRegisterScreen.name);
                          },
                          child: Padding(
                            padding:  REdgeInsets.only(left: 10.0),
                            child: Container(
                              width: 140.w,
                              height: 130.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: lightColorScheme.onSurface
                                      .withOpacity(0.3)),
                              child: Padding(
                                padding: REdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  Images.studentLastt,
                                  height: 130.h,
                                  width: 90.w,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ElevatedButton(
                          onPressed: () =>
                              context.pushNamed(StudentRegisterScreen.name),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: lightColorScheme.background,
                              fixedSize: Size(100.w, 50.h)),
                          child: Text('طالب',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      fontSize: 20,
                                      color: lightColorScheme.secondary))),
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
