import 'package:find_your_teacher/features/notfications/presentation/widgets/bloc_state_data_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection/injection.dart';
import '../../../teacher auth/presentation/manager/teacher_activate/teacher_activate_bloc.dart';
import '../manager/available_for_students/available_for_students_bloc.dart';
import '../manager/get_teacher_profile_bloc.dart';
import '../widgets/available_for_students.dart';
import '../widgets/profile_content.dart';
import '../widgets/teacher_cover.dart';
import 'not_active_teacher.dart';

class TeachersProfile extends StatelessWidget {
  const TeachersProfile({
    super.key,
    required this.userName,
    required this.aboutMe,
    required this.subjects,
    required this.locations,
    required this.price,
    required this.img,
  });

  static String name = "teacher_profile";
  static String path = "/teacher_profile";
  final String userName;
  final String aboutMe;
  final List<String> subjects;
  final List<String> locations;
  final int price;
  final String img;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<AvailableForStudentsBloc>(),
        ),
        BlocProvider.value(
          value: getIt<TeacherActivateBloc>()..add(TeacherActivateEvent()),
        ),
      ],
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () => _onRefresh(context),
          child: BlocBuilder<TeacherActivateBloc, TeacherActivateState>(
            builder: (context, state) {
              final activationState = state.activateState;
              if (activationState.data?.user ?? true) {
                return BlocStateDataBuilder(
                  data: activationState,
                  onFailed: const Center(child: Text("failed")),
                  onSuccess: (data) => ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Column(
                        children: [
                          BuildTeacherCover(
                            name: userName,
                            photo: img,
                          ),
                          AvailableForStudents(),
                          TeacherProfileContent(
                            aboutMe: aboutMe,
                            subjects: subjects,
                            locations: locations,
                            price: price,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.only(
                    left: 45.0,
                  ),
                  child: NotActiveTeacher(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<GetTeacherProfileBloc>(context).add(RefreshEvent());
  }
}

