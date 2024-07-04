
import 'package:find_your_teacher/features/search%20and%20filter/presentation/manager/search_with_filter/search_and_filter_bloc.dart';
import 'package:find_your_teacher/features/search%20and%20filter/presentation/widgets/filterd_teachers_card.dart';
import 'package:find_your_teacher/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'filter_page.dart';


class FilterdTeachers extends StatelessWidget {
  static String name = "filter_teacher_page";
  static String path = "/filter_teacher_page";
  const FilterdTeachers({

    Key? key,
    required this.subjectIds,
    required this.locationIds,
    required this.academicLevelIds,
    required this.genderName,
  }) : super(key: key);

  final List<String> subjectIds;
  final List<String> locationIds;
  final List<String> academicLevelIds;
  final String genderName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<SearchAndFilterBloc>()
        ..add(
          FilterEvent(
            locationIds: locationIds,
            genderName: genderName,
            academicLevels: academicLevelIds,
            subjectIds: subjectIds,
            onSuccess: () {}, maxPrice:parsedPrice,
          ),
        ),

      child: Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Container(
                    margin: REdgeInsetsDirectional.only(start: 30),
                    child: Text(
                      "المعلمين",
                      style: Theme.of(context).textTheme.bodyLarge,
                    )),
                SizedBox(
                  height: 10.h,
                ),
                TeachersAfterFilter(),
              ],
            )
          ],
        ),
      ),
    );
  }
}





