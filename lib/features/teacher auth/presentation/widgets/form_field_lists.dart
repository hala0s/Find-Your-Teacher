import 'package:find_your_teacher/core/bloc/app_state_bloc.dart';
import 'package:find_your_teacher/core/theme/colors.dart';
import 'package:find_your_teacher/features/notfications/presentation/widgets/bloc_state_data_builder.dart';
import 'package:find_your_teacher/features/search%20and%20filter/data/models/filter_model.dart';
import 'package:find_your_teacher/features/teacher%20auth/data/models/complete_registrer_model.dart';
import 'package:find_your_teacher/features/teacher%20auth/presentation/manager/second_complete_profile/second_complete_profile_bloc.dart';
import 'package:find_your_teacher/features/teacher_home/presentation/pages/nav_bar.dart';
import 'package:find_your_teacher/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/widgets/my_button.dart';

class CardInfoForm extends StatelessWidget {
  final String title;
  final String svgPicture;
  final List<String> dropdownValues;
  final List<String> dropdownValues1;
  final void Function(List<String>)? onChanged;
  final String hint;

  CardInfoForm({
    Key? key,
    required this.title,
    required this.svgPicture,
    required this.dropdownValues,
    required this.dropdownValues1,
    required this.onChanged,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ValueItem> valueItems = [];

    for (int i = 0; i < dropdownValues.length; i++) {
      valueItems.add(ValueItem(
        label: dropdownValues[i],
        value: dropdownValues1[i],
      ));
    }

    return Card(
      elevation: 0.0,
      color: lightColorScheme.onPrimary,
      child: InputDecorator(
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: title,
          labelStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Theme.of(context).colorScheme.onErrorContainer),
          prefixIcon: SizedBox(
            height: 20,
            width: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                svgPicture,
                height: 20,
                width: 20,
              ),
            ),
          ),
        ),
        child: Padding(
          padding: REdgeInsets.all(4.0),
          child: MultiSelectDropDown(
            searchBackgroundColor: lightColorScheme.secondary,
            focusedBorderColor: lightColorScheme.onPrimary,
            hint: hint,
            borderColor: lightColorScheme.onPrimary,
            fieldBackgroundColor: lightColorScheme.onPrimary,
            selectedOptionTextColor: lightColorScheme.secondary,
            onOptionSelected: (options) {
              final selectedIds =
                  options.map((item) => item.value as String).toList();
              onChanged?.call(selectedIds);
            },
            options: valueItems,
            selectionType: SelectionType.multi,
            chipConfig: const ChipConfig(wrapType: WrapType.scroll),
            dropdownHeight: 200,
            optionTextStyle: TextStyle(
              fontSize: 14,
              color: lightColorScheme.secondary,
            ),
            selectedOptionIcon: Icon(
              Icons.check_circle,
              color: lightColorScheme.primary,
            ),
            selectedOptionBackgroundColor:
                lightColorScheme.onPrimary.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}

class AboutMeForm extends StatelessWidget {
  final TextEditingController aboutMeController;
  FocusNode myFocusNode = FocusNode();

  AboutMeForm({Key? key, required this.aboutMeController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: lightColorScheme.onBackground,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: TextFormField(
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15),
          controller: aboutMeController,
          focusNode: myFocusNode,
          decoration: InputDecoration(
            contentPadding: REdgeInsets.all(8),
            border: InputBorder.none,
            // labelText: "حول ",
            labelStyle: TextStyle(
              fontSize: 18,
              color: myFocusNode.hasFocus
                  ? lightColorScheme.secondary
                  : lightColorScheme.onSurfaceVariant,
            ),
            prefixIcon: SizedBox(
              height: 20,
              width: 20,
              child: Padding(
                padding: REdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  Images.aboutMeIcon,
                  height: 20,
                  width: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PriceForm extends StatelessWidget {
  final TextEditingController price;
  FocusNode myFocusNode = FocusNode();

  PriceForm({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: lightColorScheme.onBackground,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: TextFormField(
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15),
          keyboardType: TextInputType.number,
          controller: price,
          focusNode: myFocusNode,
          decoration: InputDecoration(
            contentPadding: REdgeInsets.all(8),
            border: InputBorder.none,
            // labelText: "ضع سعر الجلسة ",
            labelStyle: TextStyle(
              fontSize: 18,
              color: myFocusNode.hasFocus
                  ? lightColorScheme.secondary
                  : lightColorScheme.onSurfaceVariant,
            ),
            prefixIcon: SizedBox(
              height: 20,
              width: 20,
              child: Padding(
                  padding: REdgeInsets.all(8.0),
                  child: Icon(
                    PhosphorIconsBold.creditCard,
                    size: 25,
                    color: Theme.of(context).colorScheme.onSurface,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}

class PriceFormStudent extends StatefulWidget {
  final TextEditingController price;

  PriceFormStudent({Key? key, required this.price}) : super(key: key);

  @override
  State<PriceFormStudent> createState() => _PriceFormStudentState();
}

class _PriceFormStudentState extends State<PriceFormStudent> {
  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15),
        keyboardType: TextInputType.number,
        controller: widget.price,
        focusNode: myFocusNode,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15.0),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                REdgeInsets.symmetric(vertical: 28.0, horizontal: 8),
            labelText: "متوسط سعر الجلسة ",
            labelStyle: TextStyle(
              fontSize: 15,
              color: myFocusNode.hasFocus
                  ? lightColorScheme.secondary
                  : lightColorScheme.onSurfaceVariant,
            ),
            prefixIcon: Icon(
              PhosphorIconsBold.creditCard,
              color: lightColorScheme.onSurface,
            )),
      ),
    );
  }
}
