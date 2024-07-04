
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class GenderSelection extends StatefulWidget {
  const GenderSelection({Key? key}) : super(key: key);

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String? select;
  @override

  Widget build(BuildContext context) {

    return SizedBox(
      height: 40.h,
      child: Row(
        children: [
          addRadioButton(0, 'ذكر', Theme.of(context).textTheme.bodySmall),
          SizedBox(
            width: 100,
          ),
          addRadioButton(1,'انثى',Theme.of(context).textTheme.bodySmall)
        ],
      ),
    );
  }

  Row addRadioButton(int btnValue, String title, [TextStyle? bodySmall]) {
    List gender = ['male',
      'female'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).colorScheme.onSurface,
          value: gender[btnValue],
          groupValue: select,
          onChanged: (value) {
            setState(() {
              select = value;
            });
          },
        ),
        Text(title)
      ],
    );
  }
}
