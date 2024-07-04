import 'package:find_your_teacher/core/theme/colors.dart';
import 'package:find_your_teacher/features/student_auth/presentation/pages/choose_major.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ArrowButton extends StatefulWidget {
  const ArrowButton({
    super.key,
  });

  @override
  State<ArrowButton> createState() => _ArrowButtonState();
}

class _ArrowButtonState extends State<ArrowButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: 90.w,
      child: FittedBox(
        child: ElevatedButton(
            onPressed: () {
              context.pushNamed(ChooseMajor.name);
            },
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: lightColorScheme.secondary),
            child: const Icon(
              Icons.arrow_forward_outlined,
              color: Colors.white,
            )),
      ),
    );
  }
}

class ArrowButton1 extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final bool isLoading;

  const ArrowButton1({
    super.key,
    required this.onTap,
    required this.icon,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 79.h,
      width: 90.w,
      child: FittedBox(
        child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: isLoading
                    ? lightColorScheme.onPrimary
                    : lightColorScheme.secondary),
            child: isLoading
                ? Align(
                    alignment: Alignment.topCenter,
                    child: Center(
                      child: CircularProgressIndicator(
                          color: lightColorScheme.secondary),
                    ),
                  )
                : Icon(
                    icon,
                    color: lightColorScheme.onPrimary,
                  )),
      ),
    );
  }
}
