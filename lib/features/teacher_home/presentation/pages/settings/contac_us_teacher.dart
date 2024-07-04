import 'package:find_your_teacher/core/theme/colors.dart';
import 'package:find_your_teacher/features/teacher_home/presentation/pages/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../resources/resources.dart';

class ContactUsTeacherScreen extends StatelessWidget {
  static String name = "contact_us_screen_teacher";
  static String path = "/contact_us_screen_teacher";

  const ContactUsTeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(   leading:  IconButton(onPressed: (){
        context.pop();
      }, icon: Icon(Icons.arrow_back_outlined,color: Theme.of(context).colorScheme.secondary,)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'هل نسيت كلمة السر؟',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'تواصل مع فريق FYT لمعرفة كلمة السر الخاص بك ',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: REdgeInsets.all(8.0),
              child: SvgPicture.asset(
                Images.checkYourPhone,
                height: 140.h,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
                height: 225.h,
                width: 320.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                ),
                child: Center(
                  child: Padding(
                      padding: REdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "فريق الدعم ",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(color: lightColorScheme.primary),
                          ),
                          SizedBox(
                            height:12.h,
                          ),
                          Text('0945635276',
                              style: Theme.of(context).textTheme.bodyLarge),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text("0945635277",
                              style: Theme.of(context).textTheme.bodyLarge),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text('0945635278',
                              style: Theme.of(context).textTheme.bodyLarge)
                        ],
                      )),
                )),
          ],
        ),
      ),
    );
  }
}
