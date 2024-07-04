import 'package:find_your_teacher/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddIcon extends StatelessWidget {
  const AddIcon({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: FittedBox(
        child: ElevatedButton(
          onPressed: () {
            onPressed;
          },
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            backgroundColor: Theme.of(context).colorScheme.surface,
            foregroundColor: Theme.of(context).colorScheme.onSurface,
            shape: const CircleBorder(),
            padding: REdgeInsets.all(10),
          ),
          child:  Icon(
            Icons.add,
            color: lightColorScheme.errorContainer,
            size: 50,
          ),
        ),
      ),
    );
  } }