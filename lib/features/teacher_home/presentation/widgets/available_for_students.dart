import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:find_your_teacher/core/theme/colors.dart';

import '../../../../core/bloc/app_state_bloc.dart';
import '../../data/models/available_model.dart';
import '../../presentation/manager/available_for_students/available_for_students_bloc.dart';

class AvailableForStudents extends StatefulWidget {
  AvailableForStudents({Key? key}) : super(key: key);

  @override
  _AvailableForStudentsState createState() => _AvailableForStudentsState();
}

class _AvailableForStudentsState extends State<AvailableForStudents> {
  bool isAvailable = false;
  late Color yesColor;
  late Color noColor;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    yesColor = Theme.of(context).colorScheme.onSurface;
    noColor = Theme.of(context).colorScheme.onErrorContainer;
  }

  void updateColors({required bool available}) {
    setState(() {
      if (!available) {
        yesColor = Theme.of(context).colorScheme.onErrorContainer;
        noColor = Theme.of(context).colorScheme.onSurface;
      } else {
        yesColor = Theme.of(context).colorScheme.onSurface;
        noColor = Theme.of(context).colorScheme.onErrorContainer;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: REdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
          child: Container(
            width: 340.w,
            height: 154.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.w),
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("هل انت متاح للتدريس ؟"),
                SizedBox(height: 10.h),
                BlocSelector<AvailableForStudentsBloc,
                    AvailableForStudentsState, BlocStateData<AvailableModel>>(
                  selector: (state) => state.availableForStudents,
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            updateColors(available: true);
                            context
                                .read<AvailableForStudentsBloc>()
                                .add(AvailableForStudentsEvent(
                                    available: true,
                                    onSuccess: () {
                                      print(yesColor);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        backgroundColor:
                                            lightColorScheme.primary,
                                        content: const Text(
                                          "اصبحت متاح للتدريس",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ));
                                    }));
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(yesColor),
                          ),
                          child: Text(
                            "نعم",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: lightColorScheme.onPrimary),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        ElevatedButton(
                          onPressed: () {
                            updateColors(available: false);
                            context
                                .read<AvailableForStudentsBloc>()
                                .add(AvailableForStudentsEvent(
                                    available: false,
                                    onSuccess: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        backgroundColor:
                                            lightColorScheme.primary,
                                        content: const Text(
                                          "اصبحت غير متاح للتدريس ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ));
                                    }));
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(noColor),
                          ),
                          child: Text(
                            "لا",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: lightColorScheme.onPrimary),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
