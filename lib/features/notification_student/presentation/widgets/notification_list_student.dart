import 'package:find_your_teacher/features/notfications/data/models/notifications_model.dart';
import 'package:find_your_teacher/features/notfications/presentation/maneger/notifications_bloc.dart';
import 'package:find_your_teacher/features/notfications/presentation/widgets/bloc_state_data_builder.dart';
import 'package:find_your_teacher/features/notification_student/presentation/manager/student_notification/student_notifications_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/bloc/app_state_bloc.dart';
import '../../data/models/notification_noti_model.dart';

class StudentNotificationList extends StatelessWidget {
  StudentNotificationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<StudentNotificationsBloc, StudentNotificationsState,
        BlocStateData<NotificationStudentModels>>(
      selector: (state) => state.notificationsState,
      builder: (context, state) {
        if (state.data?.notifications == null || state.data!.notifications.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 70.h,),
              const Center(child: Text("لايوجد اشعارات")),
            ],
          );
        }
        return BlocStateDataBuilder(
          data: state,
          onFailed: const Text("failed to load data"),
          onInit: const Text(" "),
          onSuccess: (data) => Card(
            elevation: 0,
            color: Theme.of(context).colorScheme.background,
            child: Padding(
              padding: REdgeInsets.all(12),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: state.data?.notifications.length,
                  itemBuilder: (context, index) {
                    final category = data?.notifications[index];
                    return Container(
                      height: 150.h,
                      width: 250.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: Theme.of(context).colorScheme.background,
                      ),
                      child: Padding(
                        padding: REdgeInsets.all(8),
                        child: Card(
                          color: Theme.of(context).colorScheme.onPrimary,
                          elevation: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ListTile(
                                title: Text(
                                  category?.title ?? "",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                subtitle: Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  category?.body ?? " ",
                                  style:
                                  Theme.of(context).textTheme.bodySmall,
                                ),
                                leading: FittedBox(
                                  child: CircleAvatar(
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    radius: 70,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        );
      },
    );
  }
}
