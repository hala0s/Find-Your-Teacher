import 'package:find_your_teacher/core/bloc/app_state_bloc.dart';
import 'package:find_your_teacher/core/theme/colors.dart';
import 'package:find_your_teacher/features/student_auth/domain/entities/auth_entities.dart';
import 'package:find_your_teacher/features/student_auth/presentation/manager/log_in_student_bloc/log_in_student_bloc.dart';
import 'package:find_your_teacher/features/student_auth/presentation/pages/sign_up_screen.dart';
import 'package:find_your_teacher/features/student_home/presentation/pages/student_nav_bar.dart';
import 'package:find_your_teacher/injection/injection.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/my_button.dart';
import '../../../../core/widgets/textformfeild.dart';
import '../../../student_home/presentation/pages/student_home_page.dart';
import '../../../teacher_home/presentation/pages/settings/contac_us_teacher.dart';
import '../../data/models/studentModels.dart';

class StudentLoginScreen extends StatefulWidget {
  static String name = "student_login_screen";
  static String path = "/student_login_screen";

  const StudentLoginScreen({Key? key}) : super(key: key);

  @override
  State<StudentLoginScreen> createState() => _StudentLoginScreenState();
}

class _StudentLoginScreenState extends State<StudentLoginScreen> {
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  bool isRememberMe = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<LogInStudentBloc>(),
      child: Form(
        key: _formKey,
        child: Builder(builder: (context) {
          return Scaffold(
            body: ListView(children: [
              SizedBox(
                height: 80.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'مرحبا بك مجددا',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'قم بتسجيل الدخول لتتمكن من البحث عن المعلمين',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              SizedBox(
                height: 80.h,
              ),
              Container(
                  alignment: AlignmentDirectional.topStart,
                  margin: REdgeInsetsDirectional.only(start: 40),
                  child: Text(
                    'رقم الهاتف',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )),
              SizedBox(height: 7.h,),
              PhoneNumField(controller: phoneNumController),
              SizedBox(
                height: 20.h,
              ),
              Container(
                  alignment: AlignmentDirectional.topStart,
                  margin: REdgeInsetsDirectional.only(start: 40),
                  child: Text(
                    'كلمة المرور ',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )),
              SizedBox(height: 7.h,),
              PassTextField(
                controller: passWordController,
              ),
              SizedBox(
                height: 7.h,
              ),
              SizedBox(
                width: 400.0.w,
                child: BuildRememberMe(),
              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                  padding: REdgeInsetsDirectional.only(start: 40, end: 40),
                  child: BlocSelector<LogInStudentBloc, LogInStudentState,
                      BlocStateData<AuthModel>>(
                    selector: (state) => state.logInState,
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 40,right: 40),
                        child: MainButton(
                          isLoading: state.isLoading,
                          text: 'تسجيل الدخول',
                          backgroundColor: lightColorScheme.onSecondaryContainer,
                          size: Size(100.w, 50.h),
                          onPressed: () async {
                            print("fcm is ${await FirebaseMessaging.instance.getToken()}");

                            context
                                .read<LogInStudentBloc>()
                                .add(LogInStudentEvent(
                                studentPhoneNumber: phoneNumController.text,
                                studentPassword: passWordController.text,
                                onSuccess: () {
                                  context.goNamed(StudentNavBarScreen.name);
                                }, fcmToken:  await FirebaseMessaging.instance.getToken(),));
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('اكمال تسجيل الدخول')));
                            }
                          },
                        ),
                      );
                    },
                  )),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'لاتمتلك حساب؟',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextButton(
                    onPressed: () {
                      context.goNamed(StudentRegisterScreen.name);
                    },
                    child: Text(
                      'انشاء حساب',
                      style: TextStyle(
                          fontSize: 12, color: lightColorScheme.surfaceVariant),
                    ),
                  ),
                ],
              ),
            ]),
          );
        }),
      ),
    );
  }

  Row BuildRememberMe() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
              value: isRememberMe,
              onChanged: (value) {
                setState(() {
                  isRememberMe = value!;
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Colors.grey[400]!),
              ),
              checkColor: Colors.white,
              activeColor: lightColorScheme.onTertiaryContainer,
            ),
            Text(
              'تذكرني',
              style: TextStyle(
                  fontSize: 12, color: lightColorScheme.onErrorContainer),
            ),
          ],
        ),
        SizedBox(
          width: 30.w,
        ),
        TextButton(
          onPressed: () {},
          child: TextButton(
            onPressed: () {
              context.pushNamed(ContactUsTeacherScreen.name);
            },
            child: Text(
              ' هل نسيت كلمة المرور ؟',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
      ],
    );
  }
}
