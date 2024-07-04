import 'package:find_your_teacher/core/bloc/app_state_bloc.dart';
import 'package:find_your_teacher/features/notfications/presentation/widgets/bloc_state_data_builder.dart';
import 'package:find_your_teacher/features/teacher%20auth/data/models/activate_teacher_model.dart';
import 'package:find_your_teacher/features/teacher_home/presentation/pages/nav_bar.dart';
import 'package:find_your_teacher/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../manager/teacher_activate/teacher_activate_bloc.dart';

class ActivateScreen extends StatelessWidget {
  const ActivateScreen({super.key});

  static String name = "activate_teacher";
  static String path = "/activate_teacher";

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<TeacherActivateBloc>()..add(TeacherActivateEvent()),
      child: Scaffold(
        body: Center(
          child: BlocSelector<TeacherActivateBloc, TeacherActivateState,
              BlocStateData<TeacherActivateModel>>(
            selector: (state) => state.activateState,
            builder: (context, state) {
              if (state.data?.user ?? false) {
                return BlocStateDataBuilder(
                  data: state,
                  onFailed: const Text("failed to load"),
                  onSuccess: (data) {
                    return const Column(
                      children: [
                        Text("لم يتم تفعيل حسابك "),
                      ],
                    );
                  },
                );
              } else {
                if (context.mounted){
                  context.goNamed(NavBarScreen.name);
                }}
                return Container();
            },
          ),
        ),
      ),
    );
  }
}