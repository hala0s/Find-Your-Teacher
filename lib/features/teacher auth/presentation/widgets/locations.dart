
import 'package:flutter/material.dart';
import 'package:multi_dropdown/models/value_item.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../../../../core/theme/colors.dart';

class locationForm extends StatelessWidget {
  locationForm({super.key, required this.title, required this.dropdownValues, required this.dropdownValues1, required this.multiSelectController,});

  final String title;
 final  List<String> dropdownValues ;
 final MultiSelectController multiSelectController;

  final  List<String> dropdownValues1;

  @override
  Widget build(BuildContext context) {
    List<ValueItem> valueItems = [];

    for (int i = 0; i < dropdownValues.length; i++) {
      valueItems
          .add(ValueItem(label: dropdownValues[i], value: dropdownValues1[i]));
    }

    return Card(
      elevation: 0.0,
      color: lightColorScheme.onPrimary,

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MultiSelectDropDown(
            controller:multiSelectController ,
            searchBackgroundColor: lightColorScheme.secondary,
            focusedBorderColor: lightColorScheme.onPrimary,
            hint: "اختار",
            borderColor: lightColorScheme.onPrimary,
            fieldBackgroundColor: lightColorScheme.onPrimary,
            selectedOptionTextColor: lightColorScheme.secondary,
            onOptionSelected: (options) {
              debugPrint(options.toString());
            },
            options: valueItems,
            // Use the list of ValueItem objects
            selectionType: SelectionType.multi,
            chipConfig: const ChipConfig(wrapType: WrapType.scroll),
            dropdownHeight: 400,
            optionTextStyle:
            TextStyle(fontSize: 14, color: lightColorScheme.secondary),
            selectedOptionIcon: Icon(
              Icons.check_circle,
              color: lightColorScheme.primaryContainer,
            ),
            selectedOptionBackgroundColor: lightColorScheme.onPrimary
                .withOpacity(0.2), // Change the color of selected options
          ),
        ),

    );
  }
}