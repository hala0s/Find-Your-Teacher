import 'package:find_your_teacher/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleIcons extends StatelessWidget {
  const CircleIcons({
    Key? key,
     required this.image,
  }) : super(key: key);
  final String image ;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: lightColorScheme.onSurface.withOpacity(0.2),
        ),
        child: Image.network(
          image,
          
        ),
      ),
    );
  }
}
class CircleIconsWithTitle extends StatelessWidget {
  const CircleIconsWithTitle({
    Key? key,
    required this.tittle,
    required this.icon,
  }) : super(key: key);
  final String tittle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: lightColorScheme.onSurface,
        ),
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      title: Text(tittle, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}

class SubCircleIcons extends StatelessWidget {
  SubCircleIcons({
    Key? key,
    required this.icon,
    required this.width,
    required this.height,
  }) : super(key: key);
  final IconData icon;
  final double width;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: lightColorScheme.onSurface.withOpacity(0.2),
      ),
      child: Icon(
        icon,
        color: Theme.of(context).colorScheme.onSurface,
        size: 25,
      ),
    );
  }
}
