import "package:find_your_teacher/core/bloc/app_state_bloc.dart";
import "package:find_your_teacher/core/theme/colors.dart";
import "package:find_your_teacher/features/teacher%20auth/presentation/manager/second_complete_profile/second_complete_profile_bloc.dart";
import "package:find_your_teacher/features/teacher%20auth/presentation/pages/complete_info_resgister2.dart";
import "package:find_your_teacher/injection/injection.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:go_router/go_router.dart";

import "complete_register_info.dart";

class CompleteInfo extends StatefulWidget {
  const CompleteInfo({Key? key}) : super(key: key);
  static String name = "complete_info";
  static String path = "/complete_info";

  @override
  State<CompleteInfo> createState() => _CompleteInfoState();
}

class _CompleteInfoState extends State<CompleteInfo> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<SecondCompleteProfileBloc>()..add(GetSecondProfileEvent()),
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: lightColorScheme.secondary,
          ),
          onPressed: () {
            context.pop;
          },
        )),
        body: Column(
          children: [
            SizedBox(height: 30.h),
            Text(
              "اكمل معلوماتك من فضلك",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: 50.h,
            ),
            Expanded(
                child: CompleteRegisterInfo(


            )),
          ],
        ),
      )),
    );
  }
}
