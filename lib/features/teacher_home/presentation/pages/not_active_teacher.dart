import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/colors.dart';

class NotActiveTeacher extends StatelessWidget {
  const NotActiveTeacher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "أهلا وسهلا بك",
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: lightColorScheme.secondary),
        ),
        SizedBox(
          height: 20.h,
        ),
        const Text(" سعيدون كونك جزء من الشبكة التعليمية"),
        const Text("سيتم مراجعة معلومات حسابك "),
        const Text(" من قبل فريق الدعم"),
        const Text("وحالما التأكد من البيانات سيتم التفعيل"),
        SizedBox(
          height: 40.h,
        ),
        SvgPicture.asset("assets/images/not_active_teacher.svg",
          height: 200.h,
          width: 150.w,
        ),
        SizedBox(
          height: 80.h,
        ),
        Text("تواصل عبر الأرقام التالية ",
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontSize: 20)),
        SizedBox(
          height: 10.h,
        ),
        const Text("0945635276"),
        const Text("0945635277"),
        const Text("0945635278")
      ],
    );
  }
}
