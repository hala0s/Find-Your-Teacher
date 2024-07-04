import 'package:find_your_teacher/core/theme/colors.dart';
import 'package:find_your_teacher/core/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateVersion extends StatefulWidget {
  const UpdateVersion({super.key});

  static String name = "update_version";
  static String path = "/update_version";

  @override
  State<UpdateVersion> createState() => _UpdateVersionState();
}

class _UpdateVersionState extends State<UpdateVersion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'الرجاء تحديث التطبيق',
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'أصبح اصدارك قديماً',
              style: TextStyle(fontSize: 20.sp),
            ),
            SizedBox(
              height: 20.h,
            ),
            MainButton(
                text: 'تنزيل',
                backgroundColor: lightColorScheme.onSurface,
                size: Size(150.w, 50.h),
                onPressed: (){
                  setState(() {
                    launchUrl(
                      Uri.parse(
                          "https://bit.ly/44HRhbR"),
                      mode: LaunchMode.externalNonBrowserApplication,
                    );
                  });
                }, )
          ],
        ),
      ),
    );
  }
}
