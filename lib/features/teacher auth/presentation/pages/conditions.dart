import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../resources/resources.dart';

class Conditions extends StatelessWidget {
  const Conditions({super.key});

  static String name = "conditions";
  static String path = "/conditions";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context.pop;
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Theme.of(context).colorScheme.secondary,
              )),
        ),
        body: ListView(
          children: [
            Padding(
              padding: REdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(
                    "شروط الخصوصية",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "شروط الخصوصية الخاصة بالتطبيق",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Image.asset(
                    Images.logo,
                    height: 200.h,
                    width: 200.h,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(end: 20),
                    child: Text(
                      "ما هي شروط الخصوصية الخاصة بنا؟",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "سياسة الخصوصية لتطبيقات الهاتف المحمول المتخصصة في العثور على مدرسين في منطقتك",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    "شكرك على اهتمامك بسياسة الخصوصية الخاصة بنا لتطبيق الهاتف المحمول المخصص للعثور على مدرسين خصوصيين في منطقتك. فيما يلي سياسة الخصوصية التي توضح كيفية جمع معلوماتك الشخصية واستخدامها وحمايتها عند استخدام تطبيقنا:",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    "جمع المعلومات: قوم بجمع المعلومات التي تقدمها طوعا عند استخدام تطبيقنا. قد تتضمن هذه المعلومات، على سبيل المثال لا الحصر، موقعك وتفضيلاتك في المدرسين.",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    " استخدام المعلومات:نحن نستخدم المعلومات التي نجمعها لتقديم خدمات بحث مخصصة للمدرسين في منطقتك ولتعزيز تجربتك في استخدام التطبيق.",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    ". حماية المعلومات:نحن ملتزمون بحماية معلوماتك الشخصية واتخاذ التدابير الأمنية المناسبة لحمايتها من الوصول أو الاستخدام أو الكشف أو التغيير غير المصرح به.",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    " تبادل المعلومات:حن لا نشارك معلوماتك الشخصية مع أطراف ثالثة دون موافقتك الصريحة.",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    " ملفات تعريف الارتباط وتقنيات التتبع:قد نستخدم ملفات تعريف الارتباط وتقنيات التتبع الأخرى لتخصيص تجربتك وتحسين أداء تطبيقنا.",
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
