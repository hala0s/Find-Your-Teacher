import 'package:find_your_teacher/core/bloc/app_state_bloc.dart';
import 'package:find_your_teacher/core/theme/colors.dart';
import 'package:find_your_teacher/features/teacher%20auth/presentation/pages/sign_up_teacher_screen.dart';
import 'package:find_your_teacher/features/teacher_home/presentation/pages/nav_bar.dart';
import 'package:find_your_teacher/injection/injection.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/my_button.dart';
import '../../../../core/widgets/textformfeild.dart';
import '../../../teacher_home/presentation/pages/settings/contac_us_teacher.dart';
import '../../domain/entities/teacher_entities.dart';
import '../manager/teacher_log_in_bloc/log_in_teacher_bloc.dart';

class TeacherLogInScreen extends StatefulWidget {
  static String name = "log_in_teacher_student_screen";
  static String path = "/log_in_teacher_student_screen";

  const TeacherLogInScreen({Key? key}) : super(key: key);

  @override
  State<TeacherLogInScreen> createState() => _TeacherLogInScreenState();
}

class _TeacherLogInScreenState extends State<TeacherLogInScreen> {
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  bool isRememberMe = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<LogInTeacherBloc>(),
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
                    'قم بتسجيل الدخول لتتمكن من البحث عن طلاب',
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
              SizedBox(height: 7.h),
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
              SizedBox(height: 7.h),
              PassTextField(
                controller: passWordController,
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: 400.0.w,
                child: BuildRememberMe(),
              ),
              SizedBox(
                height: 50.h,
              ),
              BlocSelector<LogInTeacherBloc, LogInTeacherState,
                  BlocStateData<TeacherEntities>>(
                selector: (state) => state.logInUpTeacherState,
                builder: (context, state) {
                  return Padding(
                    padding: REdgeInsets.only(left: 40, right: 40),
                    child: Padding(
                      padding: REdgeInsets.only(left: 40, right: 40),
                      child: MainButton(
                        isLoading: state.isLoading,
                        text: 'تسجيل الدخول',
                        backgroundColor: lightColorScheme.onSecondaryContainer,
                        size: Size(100.w, 50.h),
                        onPressed: () async {
                          print("fcm is ${await FirebaseMessaging.instance.getToken()}");
                          context
                              .read<LogInTeacherBloc>()
                              .add(LogInTeacherEvent(
                                teacherPassWord: passWordController.text,
                                teacherPhone: phoneNumController.text,
                                onSuccess: () {
                                  context.goNamed(NavBarScreen.name);
                                },
                                fcmToken:
                                    await FirebaseMessaging.instance.getToken(),

                              ));
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text('')));
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
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
                      context.goNamed(TeacherRegisterScreen.name);
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
