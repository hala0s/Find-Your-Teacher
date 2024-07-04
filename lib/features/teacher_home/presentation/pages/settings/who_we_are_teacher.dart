import 'package:find_your_teacher/features/student_home/presentation/pages/student_nav_bar.dart';
import 'package:find_your_teacher/features/teacher_home/presentation/pages/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../resources/resources.dart';

class WhoWeAreTeacher extends StatelessWidget {
  static String name = "who_we_are_teacher";
  static String path = "/who_we_are_teacher";

  const WhoWeAreTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(onPressed: (){
          context.pop();
        }, icon: Icon(Icons.arrow_back_outlined,color: Theme.of(context).colorScheme.secondary,)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text(
              'من نحن',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'تعرف على فريق جد معلمك أكثر ',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: 70.h,
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
                height: 220.h,
                width: 320.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Text(
                      'نحن تطبيق جد معلمك تم البدء بتأسيسه بسنة 2023 يسمح للمستخدمين بالبحث عن معلمين ومؤسسات تعليمية متوافقة مع احتياجاتهم المالية والمكانية والزمانية. يتيح البرنامج للمستخدمين العثور بسرعة على الخيارات المناسبة وفقًا لتفضيلاتهم واحتياجاتهم التعليمية.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 15),),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
