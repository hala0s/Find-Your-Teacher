import 'package:find_your_teacher/features/notfications/data/models/notifications_model.dart';
import 'package:find_your_teacher/features/notfications/presentation/maneger/notifications_bloc.dart';
import 'package:find_your_teacher/features/notfications/presentation/widgets/bloc_state_data_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/bloc/app_state_bloc.dart';
import '../../../../injection/injection.dart';
import '../../../../resources/resources.dart';

class NotificationList extends StatelessWidget {
  NotificationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<NotificationsBloc, NotificationsState,
        BlocStateData<NotificationModels>>(
      selector: (state) => state.notifications,
      builder: (context, state) {
        if (state.data?.notifications == null || state.data!.notifications.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 70.h,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(child: Text("لايوجد اشعارات")),
                ],
              ),
            ],
          );
        }
        return BlocStateDataBuilder(
          data: state,
          onFailed: const Text("failed to load data"),
          onInit: const Text(" "),
          onSuccess: (data) => RefreshIndicator(
            onRefresh: () => _onRefresh(context),
            child: Card(
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
                              children: [
                                ListTile(
                                  title: Text(
                                    category?.title ?? "",
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  subtitle: Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
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
          ),
        );
      },
    );
  }
}
Future<void> _onRefresh(BuildContext context) async {
  getIt<NotificationsBloc>()..add(NotificationsEvent(roleParam:"teacher"));
}
