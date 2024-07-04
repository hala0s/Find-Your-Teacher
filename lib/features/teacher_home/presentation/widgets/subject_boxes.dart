import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'circle_profile_photo.dart';


class ProfileBoxes extends StatelessWidget {
  const ProfileBoxes({Key? key, required this.teacherSubject, required this.location}) : super(key: key);
  final  String teacherSubject ;
  final String location ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: REdgeInsets.all(15.0),
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Colors.white,
            ),
            child: CircleIconsWithTitle(
                tittle: teacherSubject.toString(),
                icon: Icons.science, text: 'المواد',),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            padding: REdgeInsets.all(15.0),

            alignment: AlignmentDirectional.center,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Colors.white,
            ),
            child: CircleIconsWithTitle(
              tittle:location,
              icon: Icons.location_on_outlined, text: 'المناطق',
            ),
          ),
        ],
      ),
    );
  }
}
