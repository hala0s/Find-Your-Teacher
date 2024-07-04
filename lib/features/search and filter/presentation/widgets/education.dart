import 'package:expandable/expandable.dart';
import 'package:find_your_teacher/core/bloc/app_state_bloc.dart';
import 'package:find_your_teacher/features/search%20and%20filter/presentation/manager/search_with_filter/search_and_filter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/filter_model.dart';

class EducationLevel extends StatefulWidget {
  EducationLevel({super.key, required this.onChanged});

  final ValueChanged<List<String>> onChanged;

  @override
  State<EducationLevel> createState() => _EducationLevelState();
}

class _EducationLevelState extends State<EducationLevel> {
  final int usersIndex = 0;
  final _selectedEducationLevelsMap = <String, bool>{};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    child: const Text(
                      "المستوى التعليمي",
                    ),
                  ),
                  collapsed: Text(""),
                  expanded: BlocSelector<SearchAndFilterBloc,
                      SearchAndFilterState, BlocStateData<FilterModel>>(
                    selector: (state) => state.getFilterState,
                    builder: (context, state) {
                      final eduLevel = state.data?.academicLevel;
                      if (eduLevel != null) {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: eduLevel.length,
                          itemBuilder: (context, index) {
                            final level = eduLevel[index];
                            return CheckboxListTile(
                              activeColor:
                              Theme.of(context).colorScheme.onSurface,
                              checkColor:
                              Theme.of(context).colorScheme.onPrimary,
                              title: Text(
                                level?.name ?? "",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              value: _selectedEducationLevelsMap[level!.id]??false,
                              onChanged: (value) {
                                setState(() {
                                  _selectedEducationLevelsMap[level.id] =
                                      value ?? false;
                                });
                                widget.onChanged(
                                  _selectedEducationLevelsMap.entries
                                      .where((e) => e.value)
                                      .map((e) => e.key)
                                      .toList(),
                                );
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
                      padding:
                      REdgeInsets.only(left: 10, right: 10, bottom: 10),
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
