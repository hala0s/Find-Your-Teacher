import 'package:find_your_teacher/features/teacher_home/presentation/widgets/teacher_location.dart';
import 'package:find_your_teacher/features/teacher_home/presentation/widgets/teacher_subjects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../student_home/presentation/widgets/icon_styles.dart';

class TeacherProfileContent extends StatelessWidget {
  const TeacherProfileContent(
      {super.key,
      required this.aboutMe,
      required this.subjects,
      required this.locations,
      required this.price});

  final String aboutMe;
  final List<String> subjects;
  final List<String> locations;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: REdgeInsets.symmetric(horizontal: 10.0),
        children: [
          Padding(
            padding: REdgeInsets.only(right: 25.0, top: 10),
            child: Text(
              "حول",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Container(
            margin: REdgeInsets.all(10.0),
            padding: REdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                aboutMe,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: REdgeInsets.only(right: 25.0),
            child: Text("المواد"),
          ),
          SizedBox(
            height: 15.h,
          ),
          SubjectsTeacher(
            subjects: subjects,
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: REdgeInsets.only(right: 25.0),
            child: Text("المناطق"),
          ),
          LocationForTeacher(
            locations: locations,
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: REdgeInsets.only(right: 25.0),
            child: Text("سعر الجلسة"),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: 70.w,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SubCircleIcons(
                          icon: PhosphorIconsBold.creditCard,
                          width: 35,
                          height: 35,
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            "   ${price}- ليرة ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontSize: 14),
                          )),
                    ])),
          )
        ],
      ),
    );
  }
}
