import 'package:find_your_teacher/features/teacher_home/presentation/pages/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../resources/resources.dart';

class About extends StatefulWidget {
  const About({super.key});
  static String name = "about";
  static String path = "/about";

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context.pushNamed(NavBarScreen.name);
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Theme
                    .of(context)
                    .colorScheme
                    .secondary,
              )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 170.h,
            ),
            Center(
                child: Text(
                  "تطبيق FYT",
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: lightColorScheme.secondary),
                )),
            SizedBox(
              height: 30.h,
            ),
            Image.asset(
              Images.logo,
              height: 190.h,
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      launchUrl(
                        Uri.parse(
                            "https://www.facebook.com/FYT.PROJECT.SOON?mibextid=ZbWKwL"),
                        mode: LaunchMode.externalNonBrowserApplication,
                      );
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                          color: lightColorScheme.primary, width: 2.4),

                      color: lightColorScheme.onPrimary,
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Image.asset(Images.facebookNew)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      launchUrl(
                        Uri.parse(
                            "https://www.instagram.com/find.ur.teacher?igsh=MWV1YTBtajd0aW5ndQ=="),
                        mode: LaunchMode.externalNonBrowserApplication,
                      );
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                          color: lightColorScheme.primary, width: 2.4),

                      color: lightColorScheme.onPrimary,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Image.asset(Images.instagramNew)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: lightColorScheme.primary,
                        content: const Text(
                            " سوف تكون صفحة التيلجرام متوفرة قريبا",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400))));
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                          color: lightColorScheme.primary, width: 2.4),

                      color: lightColorScheme.onPrimary,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Image.asset(Images.telegramNew)),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 12.h,
            ),

          ],
        ));
  }

}