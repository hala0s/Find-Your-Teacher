import 'package:find_your_teacher/features/notfications/presentation/maneger/notifications_bloc.dart';
import 'package:find_your_teacher/features/teacher_home/presentation/pages/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../injection/injection.dart';
import '../../../student_auth/data/data_sources/local_data_source.dart';
import '../widgets/notification_list.dart';

class NotificationScreen extends StatefulWidget {
  static String name = "notifications";
  static String path = "/notifications";

  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider.value(
      value: getIt<NotificationsBloc>()
        ..add(NotificationsEvent(roleParam: "teacher")),
      child: RefreshIndicator(
        onRefresh: () => _onRefresh(context),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'الاشعارات',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            NotificationList(),
          ].animate(interval: 400.ms).fade(duration: 300.ms),
        ),
      ),
    ));
  }

  Future<void> _onRefresh(BuildContext context) async {
    getIt<NotificationsBloc>()..add(NotificationsEvent(roleParam: "teacher"));
  }
}
