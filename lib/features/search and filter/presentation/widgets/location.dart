import 'package:expandable/expandable.dart';
import 'package:find_your_teacher/core/bloc/app_state_bloc.dart';
import 'package:find_your_teacher/core/theme/colors.dart';
import 'package:find_your_teacher/features/search%20and%20filter/data/models/location_search_model.dart';
import 'package:find_your_teacher/features/search%20and%20filter/presentation/manager/search_with_filter/search_and_filter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../injection/injection.dart';
import '../../data/models/filter_model.dart';

class Location extends StatefulWidget {
  const Location({super.key, required this.onChanged});

  final ValueChanged<List<String>> onChanged;

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final _selectedLocationMap = <String, bool>{};
  final TextEditingController word = TextEditingController();
  late final SearchAndFilterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = getIt<SearchAndFilterBloc>()..add(LocationSearchEvent(word: ""));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: ExpandableNotifier(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Text("اضغط للبحث عن منطقة",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color:
                                          lightColorScheme.onErrorContainer)),
                          TextFormField(
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 15),
                            controller: word,
                            onChanged: (value) {
                              bloc.add(LocationSearchEvent(word: value));
                            },
                            decoration: InputDecoration(
                              labelText: "المنطقة",
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontSize: 15),
                              border: InputBorder.none,
                              fillColor: Colors.white,
                              prefixIcon: Icon(
                                PhosphorIconsBold.mapPin,
                                color: lightColorScheme.onSurface,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    collapsed: const Text(""),
                    expanded:
                        BlocBuilder<SearchAndFilterBloc, SearchAndFilterState>(
                      builder: (context, state) {
                        final locationState = state.locationSearchState;
                        final location = locationState.data?.locations;

                        if (locationState == BlocState.loading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (locationState == BlocState.failed) {
                          return const Center(
                              child: Text("Failed to load locations"));
                        } else if (location != null) {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: location.length,
                            itemBuilder: (context, index) {
                              final loc = location[index];
                              return CheckboxListTile(
                                activeColor:
                                    Theme.of(context).colorScheme.onSurface,
                                checkColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                title: Text(
                                  loc.name,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                value: _selectedLocationMap[loc.id] ?? false,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedLocationMap[loc.id] =
                                        value ?? false;
                                  });
                                  widget.onChanged(
                                    _selectedLocationMap.entries
                                        .where((e) => e.value)
                                        .map((e) => e.key)
                                        .toList(),
                                  );
                                },
                              );
                            },
                          );
                        }
                        return const SizedBox.shrink();
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
      ),
    );
  }
}
