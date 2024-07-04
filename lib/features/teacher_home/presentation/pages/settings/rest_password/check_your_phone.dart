import 'package:find_your_teacher/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../resources/resources.dart';
import '../../../widgets/my_button.dart';


class CheckYourPhone extends StatelessWidget {
  static String name = "check_phone_number_screen";
  static String path = "/check_phone_number_screen";

  const CheckYourPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        const Spacer(),
        Text(
          'تفقد هاتفك',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        SizedBox(
          height: 10.h,
        ),
        const Text(
          "لقد قمنا بإرسال رسالة إلى الرقم الذي أدخلته",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: REdgeInsets.all(8.0),
          child: SvgPicture.asset(
            Images.checkYourPhone,
            height: 200.h,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        const Spacer(),
        SizedBox(
          height: 20.h,
        ),
        MyButton(
            text: 'وضع رمز التأكيد',
            backgroundColor: lightColorScheme.primary,
            size: Size(317.w, 50.h),
            onPressed: () {}),
        SizedBox(
          height: 30.h,
        ),
        // MyButton(
        //     text: S.of(context).back_to_login,
        //     backgroundColor: iNActivePrimaryColor,
        //     size:  Size(317.w, 50.h),
        //     onPressed: () {}),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text(
        //       S.of(context).not_Received,
        //       style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        //     ),
        //     TextButton(
        //       onPressed: () {},
        //       child:  Text(
        //         S.of(context).Resend,
        //         style: TextStyle(fontSize: 12, color: aOrangeColor),
        //       ),
        //     ),
        //   ],
        // )
      ]),
    ));
  }
}
