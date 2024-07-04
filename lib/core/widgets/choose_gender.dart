import 'package:find_your_teacher/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class TeacherGender extends StatefulWidget {
  const TeacherGender({Key? key}) : super(key: key);

  @override
  State<TeacherGender> createState() => _TeacherGenderState();
}

class _TeacherGenderState extends State<TeacherGender> {
  String? gender;
  String? gender1 ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      child: Column(
        children: [
          Expanded(
            child: Container(
              height: 80.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: Text(
                       "ذكر",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      value:"ذكر",
                      groupValue: gender1,
                      onChanged: (value) {
                        setState(() {
                          gender1 = value!;
                        });
                      },
                      activeColor: lightColorScheme.onErrorContainer,
                      contentPadding: REdgeInsets.symmetric(horizontal: 8 ),

                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Flexible(
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: Text(
                        "أنثى",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      value: "ذكر",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                      activeColor: Theme.of(context).colorScheme.onSurface,
                      contentPadding: REdgeInsets.symmetric(horizontal: 8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}