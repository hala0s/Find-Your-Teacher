import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../resources/resources.dart';

class AboutTeacher extends StatefulWidget {
  const AboutTeacher({Key? key}) : super(key: key);
  static String name = "about_teacher";
  static String path = "/about_teacher";

  @override
  State<AboutTeacher> createState() => _AboutTeacherState();
}

class _AboutTeacherState extends State<AboutTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Theme.of(context).colorScheme.secondary,
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
                  style: Theme.of(context)
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
                      border: Border.all(color: lightColorScheme.primary,width: 2.4),

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
                      border: Border.all(color: lightColorScheme.primary,width: 2.4),

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
                      border: Border.all(color: lightColorScheme.primary,width: 2.4),

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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     GestureDetector(
            //       onTap: () {
            //         _launchURL('https://www.facebook.com/FYT.PROJECT.SOON?mibextid=ZbWKwL');
            //       },
            //       child: Container(
            //         height: 63.h,
            //         width: 63.w,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(20),
            //           color: lightColorScheme.onPrimary,
            //         ),
            //         child: SvgPicture.asset(
            //           Images.faceBook,
            //           height: 54.h,
            //           width: 43.w,
            //         ),
            //       ),
            //     ),
            //
            //     SizedBox(
            //       width: 20.w,
            //     ),
            //     Container(
            //       height: 63.h,
            //       width: 63.w,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(20),
            //         color: lightColorScheme.onPrimary,
            //       ),
            //       child: SvgPicture.asset(
            //         Images.telegram,
            //         height: 100.h,
            //         width: 100.w,
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 12.h,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     GestureDetector(
            //       onTap: (){
            //         _launchURL("https://www.linkedin.com/in/find-your-teacher-%D8%AC%D8%AF-%D9%85%D8%B9%D9%84%D9%85%D9%83-500b13289/");
            //       },
            //       child: Container(
            //         height: 63.h,
            //         width: 63.w,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(20),
            //           color: lightColorScheme.onPrimary,
            //         ),
            //         child: SvgPicture.asset(
            //           Images.linkedIn,
            //           height: 100.h,
            //           width: 100.w,
            //         ),
            //       ),
            //     ),
            //     SizedBox(
            //       width: 20.w,
            //     ),
            //     GestureDetector(
            //
            //       onTap: () {
            //         _launchURL('https://www.instagram.com/fyt_startup?igsh=MWV1YTBtajd0aW5ndQ==');
            //       },
            //       child: Container(
            //         height: 63.h,
            //         width: 63.w,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(20),
            //           color: lightColorScheme.onPrimary,
            //         ),
            //         child: SvgPicture.asset(
            //           Images.instagram,
            //           height: 100.h,
            //           width: 100.w,
            //         ),
            //       ),
            //     ),
            //   ],
            // )
          ],
        ));
  }

  Future<void> _launchURL(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }
}
