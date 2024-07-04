import 'package:find_your_teacher/core/bloc/app_state_bloc.dart';
import 'package:find_your_teacher/core/theme/colors.dart';
import 'package:find_your_teacher/core/widgets/my_button.dart';
import 'package:find_your_teacher/features/search%20and%20filter/data/models/filter_model.dart';
import 'package:find_your_teacher/features/search%20and%20filter/presentation/manager/search_with_filter/search_and_filter_bloc.dart';
import 'package:find_your_teacher/features/search%20and%20filter/presentation/pages/filterd_teachers.dart';
import 'package:find_your_teacher/features/teacher%20auth/presentation/widgets/form_field_lists.dart';
import 'package:find_your_teacher/injection/injection.dart';
import 'package:find_your_teacher/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../widgets/education.dart';
import '../widgets/gender.dart';
import '../widgets/location.dart';
import '../widgets/subjects.dart';

class FilterPage extends StatefulWidget {
  FilterPage({Key? key}) : super(key: key);
  static String name = "filter_page";
  static String path = "/filter_page";

  @override
  State<FilterPage> createState() => _FilterPageState();
}

int parsedPrice = 1000000;

class _FilterPageState extends State<FilterPage> {
  final ValueNotifier<int> isSelected = ValueNotifier(1);
  final Set<String> _subjectsIds = {};
  final Set<String> _locationIds = {};
  final Set<String> _levelIds = {};
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<SearchAndFilterBloc>()..add(GetFilterEvent()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: lightColorScheme.secondary,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: ListView(children: [
          Column(
            children: [
              Animate(
                  effects: const [
                    FadeEffect(),
                    SlideEffect(),
                  ],
                  child: Text(
                    "الفلترة",
                    style: Theme.of(context).textTheme.bodyLarge,
                  )),
              SizedBox(
                height: 20.h,
              ),
              ValueListenableBuilder(
                  valueListenable: isSelected,
                  builder: (BuildContext context, value, Widget? child) {
                    return GenderSelection(isSelected: isSelected);
                  }),
              SubjectsFilter(
                onChanged: (value) {
                  _subjectsIds.clear();
                  _subjectsIds.addAll(value);
                },
              ),
              Location(
                onChanged: (value) {
                  _locationIds.clear();
                  _locationIds.addAll(value);
                },
              ),
              PriceFormStudent(price: priceController),
              SizedBox(
                height: 50.h,
              ),
              BlocSelector<SearchAndFilterBloc, SearchAndFilterState,
                  BlocStateData<FilterModel>>(
                selector: (state) => state.getFilterState,
                builder: (context, state) {
                  return MainButton(
                    text: "فلترة",
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    size: Size(200.w, 50.h),
                    onPressed: () {
                      if (priceController.text.isNotEmpty) {
                        parsedPrice = int.tryParse(priceController.text) ?? 0;
                      }

                      context.read<SearchAndFilterBloc>().add(
                            FilterEvent(
                              locationIds: _locationIds.toList(),
                              subjectIds: _subjectsIds.toList(),
                              academicLevels: _levelIds.toList(),
                              maxPrice: parsedPrice,
                              genderName:
                                  isSelected.value.isEven ? 'female' : 'male',
                              onSuccess: () {
                                context.pushNamed(FilterdTeachers.name,
                                    queryParameters: {
                                      "genderName": isSelected.value == 0
                                          ? "female"
                                          : "male",
                                    },
                                    extra: {
                                      "locationIds": _locationIds.toList(),
                                      "subjectIds": _subjectsIds.toList(),
                                      "academicLevels": _levelIds.toList(),
                                      "maxPrice": parsedPrice,
                                    });
                              },
                            ),
                          );
                    },
                  );
                },
              ),
            ].animate(interval: 100.ms).fade(duration: 100.ms),
          ),
        ]),
      ),
    );
  }
}
