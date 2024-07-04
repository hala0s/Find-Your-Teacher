import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';

class GenderSelection extends StatefulWidget {
  final ValueNotifier<int> isSelected;
  const GenderSelection({Key? key, required this.isSelected}) : super(key: key);

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350.w,
        height: 85.h,
        child: Card(
          color: Theme.of(context).colorScheme.onPrimary,
          elevation: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("الجنس:", style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(
                width: 25.w,
              ),
              addRadioButton(
                0,
                "أنثى",
                () {
                  widget.isSelected.value = 0;
                },
                Theme.of(context).textTheme.bodySmall,
              ),

              addRadioButton(
                1,
                "ذكر",
                () {
                  widget.isSelected.value = 1;
                },
                Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),

    );
  }

  Row addRadioButton(int btnValue, String title, VoidCallback onTap,
      [TextStyle? bodySmall]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: lightColorScheme.onSurface,
          value: btnValue,
          groupValue: widget.isSelected.value,
          onChanged: (value) {
            onTap();
          },
        ),
        Text(title)
      ],
    );
  }
}
