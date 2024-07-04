import 'package:find_your_teacher/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleIconsWithTitle extends StatelessWidget {
  const CircleIconsWithTitle({
    Key? key,
    required this.tittle,
    required this.icon, required this.text,
  }) : super(key: key);
  final String tittle;
  final IconData icon;
final String text;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: lightColorScheme.errorContainer.withOpacity(0.4),
        ),
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.onSurface,
          size: 30.sp,
        ),
      ),
      title: Text(
        text,

        style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: Text(tittle,  style: Theme.of(context).textTheme.bodySmall,),
    );
  }
}

class CircleProfile extends StatelessWidget {
  const CircleProfile({
    super.key,
    required this.collapsedHeight,
    required this.photo,
  });

  final double collapsedHeight;
  final String photo;

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      top: collapsedHeight + 15,
      start: MediaQuery.of(context).size.width / 2 - 185,
      child: Container(
        padding: REdgeInsets.all(4),
        decoration: const ShapeDecoration(
          shape: CircleBorder(),
        ),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            photo,
          ),
          radius: 55,
        ),
      ),
    );
  }
}
