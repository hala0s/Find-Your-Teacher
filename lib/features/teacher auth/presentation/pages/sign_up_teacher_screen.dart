import 'package:find_your_teacher/core/bloc/app_state_bloc.dart';
import 'package:find_your_teacher/core/theme/colors.dart';
import 'package:find_your_teacher/features/teacher%20auth/presentation/manager/teacher_sign_up_bloc/sign_up_teacher_bloc.dart';
import 'package:find_your_teacher/features/teacher%20auth/presentation/pages/conditions.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/my_button.dart';
import '../../../../core/widgets/textformfeild.dart';
import '../../../../injection/injection.dart';
import 'get_teacher_profile_before_complete.dart';
import 'log_in_teacher_screen.dart';

class TeacherRegisterScreen extends StatefulWidget {
  static String name = "sign_up_teacher_screen";
  static String path = "/sign_up_teacher_screen";

  const TeacherRegisterScreen({Key? key}) : super(key: key);

  @override
  State<TeacherRegisterScreen> createState() => _TeacherRegisterScreenState();
}

class _TeacherRegisterScreenState extends State<TeacherRegisterScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<SignUpTeacherBloc>(),
      child: Builder(builder: (context) {
        return Form(
            key: _formKey,
            child: Scaffold(
              body: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 80.h,
                      ),
                      Text(
                        'انشاء حساب',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'قم بانشاء حساب للعثور على الطلاب',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        margin: REdgeInsetsDirectional.only(start: 40),
                        child: Text(
                          'الاسم',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      NameField(controller: userNameController),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        margin: REdgeInsetsDirectional.only(start: 40),
                        child: Text(
                          'رقم الهاتف',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      PhoneNumField(controller: phoneNumController),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        margin: REdgeInsetsDirectional.only(start: 40),
                        child: Text(
                          'كلمة المرور',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      PassTextField(
                        controller: passWordController,

                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      AcceptConditions(),
                      SizedBox(
                        height: 35.h,
                      ),
                      BlocSelector<SignUpTeacherBloc, SignUpTeacherState,
                          BlocStateData>(
                        selector: (state) => state.signUpTeacherState,
                        builder: (context, state) {
                          return MainButton(
                            isLoading: state.isLoading,
                            text: 'انشاء حساب ',
                            backgroundColor:
                                lightColorScheme.onSecondaryContainer,
                            size: Size(220.w, 50.h),
                            onPressed: () async {
                              if (_formKey.currentState?.validate() ?? false) {
                                context.read<SignUpTeacherBloc>().add(
                                    SignUpTeacherEvent(
                                        teacherPhoneNumber:
                                            phoneNumController.text,
                                        teacherName: userNameController.text,
                                        teacherPassword:
                                            passWordController.text,
                                        role: 'teacher',
                                        onSuccess: () {
                                          context.goNamed(
                                              GetTeacherProfileBeforeCompleteScreen
                                                  .name);
                                        },
                                        teacherGender: 'male',
                                        fcmToken:
                                            " ${await FirebaseMessaging.instance.getToken()}"));
                              }
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'هل لديك حساب مسبقا؟',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          TextButton(
                            onPressed: () =>
                                context.goNamed(TeacherLogInScreen.name),
                            child: Text(
                              'تسجيل الدخول',
                              style: TextStyle(
                                fontSize: 12,
                                color: lightColorScheme.onSurface,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ));
      }),
    );
  }

  Row AcceptConditions() {
    return Row(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: REdgeInsetsDirectional.only(
                start: 20,
              ),
              child: Checkbox(
                value: isRememberMe,
                onChanged: (value) {
                  setState(() {
                    isRememberMe = value!;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: lightColorScheme.outline),
                ),
                checkColor: Colors.white,
                activeColor: lightColorScheme.primary,
              ),
            ),
            Text(
              "بالمتابعة انت توافق على",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Padding(
              padding: REdgeInsets.only(left: 4, right: 4),
              child: GestureDetector(
                onTap: () {
                  context.pushNamed(Conditions.name);
                },
                child: Text(
                  "شروط الخصوصية",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: lightColorScheme.onTertiaryContainer,
                      ),
                ),
              ),
            ),
            Text(
              "للتطبيق",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}
