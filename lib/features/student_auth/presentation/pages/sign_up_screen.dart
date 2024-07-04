import 'package:find_your_teacher/core/bloc/app_state_bloc.dart';
import 'package:find_your_teacher/core/theme/colors.dart';
import 'package:find_your_teacher/features/student_home/presentation/pages/student_nav_bar.dart';
import 'package:find_your_teacher/features/teacher%20auth/presentation/pages/conditions.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/my_button.dart';
import '../../../../core/widgets/textformfeild.dart';
import '../../../../injection/injection.dart';
import '../manager/sign_up_student_bloc/sign_up_student__bloc.dart';
import 'log_in_screen.dart';

class StudentRegisterScreen extends StatefulWidget {
  static String name = "sign_up_student_screen";
  static String path = "/sign_up_student_screen";

  const StudentRegisterScreen({Key? key}) : super(key: key);

  @override
  State<StudentRegisterScreen> createState() => _StudentRegisterScreenState();
}

class _StudentRegisterScreenState extends State<StudentRegisterScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<SignUpStudentBloc>(),
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
                        'قم بانشاء حساب للعثور على المعلمين',
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
                      SizedBox(height: 5.h,),
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
                      PassTextField(controller: passWordController,),
                      SizedBox(
                        height: 20.h,
                      ),
                      AcceptConditions(),
                      SizedBox(
                        height: 35.h,
                      ),
                      BlocSelector<SignUpStudentBloc, SignUpStudentState,
                          BlocStateData>(
                        selector: (state) => state.signInState,
                        builder: (context, state) {
                          return MainButton(
                            isLoading: state.isLoading,
                            text: 'انشاء حساب ',
                            backgroundColor:
                            lightColorScheme.onSecondaryContainer,
                            size: Size(220.w, 50.h),
                            onPressed: () async {
                              context.read<SignUpStudentBloc>().add(
                                  SignUpStudentEvent(
                                      studentName: userNameController.text,
                                      role: 'student',
                                      studentStudentPhoneNumber:
                                      phoneNumController.text,
                                      onSuccess: () {
                                        context.goNamed(StudentNavBarScreen.name,);
                                      },
                                      studentPassword: passWordController.text,
                                      studentGender: 'male',
                                      fcmToken:
                                      " ${await FirebaseMessaging.instance.getToken()}"));
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
                                context.goNamed(StudentLoginScreen.name),
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


