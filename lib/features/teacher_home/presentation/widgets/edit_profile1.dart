
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../resources/resources.dart';

class EditProfileCard extends StatelessWidget {
  const EditProfileCard({super.key, required this.title, required this.body, required this.photo});
  final String title;
  final String body;
  final String photo;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: REdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
      child: Container(
        width: 335.w,
        // height: 84.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.white,
        ),
        child: Center(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 20, vertical: 17),
              child: Column(
                children: [
                  Row(

                    children: [
                      SvgPicture.asset(
                        photo,
                        height: 31.h,
                        width: 30.w,
                      ),
                      SizedBox(width:7.w,),
                      Text(
                        title,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                    ],
                  ),
                  SizedBox(height: 7.h,),
                  Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: REdgeInsets.only(right: 35),
                        child: Text(
                          body,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                              color: Color.fromRGBO(82,75, 107,0.49)),
                        ),
                      ))
                ],
              ),
            )),
      ),
    );
  }
}

class EditProfileCard2 extends StatelessWidget {
  const EditProfileCard2({super.key, required this.title, required this.body,});
  final String title;
  final int body;

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: REdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
      child: Container(
        width: 335.w,
        // height: 84.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.white,
        ),
        child: Center(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 20, vertical: 17),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon( PhosphorIconsBold.creditCard,
                        color: Theme.of(context).colorScheme.onSurface,size: 26,),
                      SizedBox(width: 7.w,),
                      Text(
                        title,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),


                    ],
                  ),
                  SizedBox(height: 7.h,),
                  Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: REdgeInsets.only(right: 35),
                        child: Text(
                          body.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                              color: Color.fromRGBO(82,75, 107,0.49)),
                        ),
                      ))
                ],
              ),
            )),
      ),
    );
  }
}
