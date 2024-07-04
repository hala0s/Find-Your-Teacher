import 'package:find_your_teacher/core/theme/colors.dart';
import 'package:find_your_teacher/features/notfications/presentation/maneger/notifications_bloc.dart';
import 'package:find_your_teacher/features/notification_student/presentation/manager/student_notification/student_notifications_bloc.dart';
import 'package:find_your_teacher/features/student_home/presentation/manager/student_profile/student_profile_bloc.dart';
import 'package:find_your_teacher/features/student_home/presentation/pages/student_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../injection/injection.dart';
import '../../../notfications/presentation/widgets/notification_list.dart';
import '../../../student_auth/data/data_sources/local_data_source.dart';
import '../widgets/notification_list_student.dart';

class StudentNotificationScreen extends StatefulWidget {
  static String name = "notifications";
  static String path = "/notifications";

  const StudentNotificationScreen({Key? key}) : super(key: key);

  @override
  State<StudentNotificationScreen> createState() =>
      _StudentNotificationScreenState();
}

class _StudentNotificationScreenState extends State<StudentNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context.pushNamed(StudentNavBarScreen.name);
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: lightColorScheme.secondary,
              )),
        ),
        body: BlocProvider.value(
          value: getIt<StudentNotificationsBloc>()
            ..add(StudentNotificationsEvent(roleParam: "student")),
          child: RefreshIndicator(
            onRefresh: () => _onRefresh(context),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'الاشعارات',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                StudentNotificationList(),
              ].animate(interval: 400.ms).fade(duration: 300.ms),
            ),
          ),
        ));
  }
}

Future<void> _onRefresh(BuildContext context) async {
  getIt<StudentNotificationsBloc>()
    ..add(StudentNotificationsEvent(roleParam: "student"));
}
