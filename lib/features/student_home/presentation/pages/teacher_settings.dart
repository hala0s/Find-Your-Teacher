import 'package:find_your_teacher/core/theme/colors.dart';
import 'package:find_your_teacher/features/student_auth/data/data_sources/local_data_source.dart';
import 'package:find_your_teacher/features/student_auth/presentation/pages/choose_major.dart';
import 'package:find_your_teacher/features/student_home/presentation/pages/About_screen.dart';
import 'package:find_your_teacher/features/teacher_home/presentation/pages/settings/contac_us_teacher.dart';
import 'package:find_your_teacher/features/teacher_home/presentation/pages/settings/rest_password/contact_us.dart';
import 'package:find_your_teacher/features/teacher_home/presentation/pages/settings/who_we_are.dart';
import 'package:find_your_teacher/features/teacher_home/presentation/pages/settings/who_we_are_teacher.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../resources/resources.dart';
import '../../../../core/app_routes.dart';
import '../../../teacher_home/presentation/pages/settings/about_us.dart';

class TeacherSettingsUi extends StatefulWidget {
  const TeacherSettingsUi({super.key});

  @override
  State<TeacherSettingsUi> createState() => _TeacherSettingsUiState();
  static String name = "teacher_settings_screen";
  static String path = "/teacher_settings_screen";
}

class _TeacherSettingsUiState extends State<TeacherSettingsUi> {
  bool status = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: 8.w),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'الإعدادات',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 23),
                    )),
              ),
              SizedBox(
                height: 25.h,
              ),

              // Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(22),
              //       color: Colors.white,
              //       border: Border.all(color: Colors.white),
              //     ),
              //     child: ListTile(
              //       title: Text('الاشعارات',
              //           style: Theme.of(context).textTheme.bodyMedium),
              //       leading: SvgPicture.asset(
              //         Images.notifications,
              //         color: lightColorScheme.shadow.withOpacity(0.7),
              //       ),
              //       trailing: Switch(
              //         activeColor: Colors.white,
              //         activeTrackColor: Colors.green,
              //         inactiveTrackColor: Colors.white12,
              //         value: status,
              //         onChanged: (bool value) {
              //           setState(() {
              //             status = value;
              //           });
              //         },
              //       ),
              //     )),
              SizedBox(
                height: 14.h,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(ContactUsTeacherScreen.name);
                    },
                    child: ListTile(
                      title: Text('كلمة السر',
                          style: Theme.of(context).textTheme.bodyMedium),
                      leading: SvgPicture.asset(
                        Images.password,
                        color: lightColorScheme.shadow.withOpacity(0.7),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          context.pushNamed(ContactUsTeacherScreen.name);
                        },
                        icon: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  )),
              SizedBox(
                height: 14.h,
              ),

              GestureDetector(
                onTap: () {
                  context.pushNamed(AboutTeacher.name);
                },
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                    ),
                    child: ListTile(
                      title: Text(' حول التطبيق',
                          style: Theme.of(context).textTheme.bodyMedium),
                      leading: Icon(
                        Icons.question_answer_outlined,
                        color: lightColorScheme.shadow.withOpacity(0.7),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          context.pushNamed(AboutTeacher.name);
                        },
                        icon: Icon(Icons.arrow_forward_ios),
                      ),
                    )),
              ),
              SizedBox(
                height: 14.h,
              ),
              GestureDetector(
                onTap: () {
                  context.pushNamed(WhoWeAreTeacher.name);
                },
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                    ),
                    child: ListTile(
                      title: Text(' من نحن',
                          style: Theme.of(context).textTheme.bodyMedium),
                      leading: Icon(
                        Icons.question_mark_outlined,
                        color: lightColorScheme.shadow.withOpacity(0.7),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          context.pushNamed(WhoWeAreTeacher.name);
                        },
                        icon: Icon(Icons.arrow_forward_ios),
                      ),
                    )),
              ),
              SizedBox(
                height: 14.h,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("تسجيل الخروج",
                              style: Theme.of(context).textTheme.bodyMedium),
                          actions: [
                            TextButton(
                              onPressed: () async {
                                await AuthImpLocalDataSource().deleteToken();
                                await FirebaseMessaging.instance.deleteToken();

                                router.goNamed(ChooseMajor.name);
                              },
                              child: Text(
                                "نعم",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "لا",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ],
                        );
                      });
                },
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                    ),
                    child: ListTile(
                        title: Text(' تسجيل الخروج',
                            style: Theme.of(context).textTheme.bodyMedium),
                        leading: SvgPicture.asset(Images.logout),
                        trailing: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: lightColorScheme.shadow.withOpacity(0.7),
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("تسجيل الخروج",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                      actions: [
                                        TextButton(
                                          onPressed: () async {
                                            await AuthImpLocalDataSource()
                                                .deleteToken();
                                            await FirebaseMessaging.instance
                                                .deleteToken();

                                            context.goNamed(ChooseMajor.name);
                                          },
                                          child: Text(
                                            "نعم",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            "لا",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            }))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
