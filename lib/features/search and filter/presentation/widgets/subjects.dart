import 'package:expandable/expandable.dart';
import 'package:find_your_teacher/core/bloc/app_state_bloc.dart';
import 'package:find_your_teacher/features/search%20and%20filter/presentation/manager/search_with_filter/search_and_filter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../resources/resources.dart';
import '../../data/models/filter_model.dart';

class SubjectsFilter extends StatefulWidget {
  const SubjectsFilter({
    super.key,
    required this.onChanged,
  });

  final ValueChanged<List<String>> onChanged;

  @override
  State<SubjectsFilter> createState() => _SubjectsFilterState();
}

class _SubjectsFilterState extends State<SubjectsFilter> {
  final Map<String, bool> _selectedSubjectsMap = {};

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          elevation: 0,
          color: Theme.of(context).colorScheme.onPrimary,
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToCollapse: true,
                  ),
                  header: Padding(
                    padding: REdgeInsets.all(10),
                    child: Row(
                      children: [
                        SizedBox(width: 10.w,),
                        SvgPicture.asset(
                          Images.subjectIcon,
                          width: 24.w,
                          height: 24.h,
                          color: colorScheme.onSurface,
                        ),
                        SizedBox(width: 10.w),
                        const Text(
                          "المواد",
                        ),
                      ],
                    ),
                  ),
                  collapsed: const Text(""),
                  expanded: BlocSelector<SearchAndFilterBloc,
                      SearchAndFilterState, BlocStateData<FilterModel>>(
                    selector: (state) => state.getFilterState,
                    builder: (context, state) {
                      final subjects = state.data?.subjects;
                      if (subjects != null) {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: subjects.length,
                          itemBuilder: (context, index) {
                            final subject = subjects[index];
                            return CheckboxListTile(
                              activeColor: colorScheme.onSurface,
                              checkColor: colorScheme.onPrimary,
                              title: Text(
                                subject?.name ?? "",
                                style: theme.textTheme.bodySmall,
                              ),
                              value: _selectedSubjectsMap[subject?.id] ?? false,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  if (subject?.id != null) {
                                    _selectedSubjectsMap[subject!.id] = newValue!;
                                  }
                                  widget.onChanged(
                                    _selectedSubjectsMap.entries
                                        .where((e) => e.value)
                                        .map((e) => e.key)
                                        .toList(),
                                  );
                                });
                              },
                            );
                          },
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                  builder: (_, collapsed, expanded) {
                    return Padding(
                      padding: REdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        theme: const ExpandableThemeData(
                          crossFadePoint: 0,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
