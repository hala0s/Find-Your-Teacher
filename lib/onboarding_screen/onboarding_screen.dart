import 'package:find_your_teacher/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../features/teacher auth/presentation/widgets/arrow_button.dart';

class OnBoardContent extends StatefulWidget {
  const OnBoardContent({
    super.key,
  });

  static String name = "on_boarding_screen";
  static String path = "/on_boarding_screen";

  @override
  State<OnBoardContent> createState() => _OnBoardContentState();
}

class _OnBoardContentState extends State<OnBoardContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:[ Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(left: 290.0),
                //   child: Image.asset(
                //     Images.logo,
                //     height: 35.h,
                //     width: 35.w,
                //   ),
                // ),
                SizedBox(
                  height: 80.h,
                ),
                Container(
                  margin: REdgeInsetsDirectional.only(start: 20),
                  alignment: AlignmentDirectional.center,
                  child: SvgPicture.asset(
                    Images.wlcScreen,
                    height: 280,
                  ),
                ),
                Image.asset(
                  Images.fytTagline,
                  height: 200,
                ),
                Container(
                  margin: REdgeInsets.only(left: 40, right: 40),
                  child: Text(
                    "كن جزء من الشبكة التعليمية ",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                    padding: REdgeInsets.all(10.0),
                    child: Container(
                        margin: REdgeInsets.only(right: 250),
                        child: const ArrowButton())),
              ]),
        ),
   ]   ),
    );
  }
}
