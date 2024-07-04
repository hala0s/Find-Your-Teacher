import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Size size;
  final VoidCallback onPressed;
  final bool isLoading;

  const MyButton({
    Key? key,
    this.isLoading = false,
    required this.text,
    required this.backgroundColor,
    required this.size,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        fixedSize: size,
      ),
      child: isLoading
          ? Center(
        child: CircularProgressIndicator(value: 1.r),
      )
          : Text(
        text,
        style: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: Colors.white),
      ),
    );
  }
}
