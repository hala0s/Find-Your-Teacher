import 'package:find_your_teacher/features/student_home/presentation/pages/teacher_profile_student.dart';
import 'package:find_your_teacher/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../../core/app_routes.dart';
import '../../../../core/bloc/app_state_bloc.dart';
import '../../../../core/theme/colors.dart';
import '../../../../resources/resources.dart';
import '../../../search and filter/data/models/search_model.dart';
import '../../../search and filter/presentation/manager/search_with_filter/search_and_filter_bloc.dart';
import '../../../search and filter/presentation/pages/filter_page.dart';
import '../manager/top_teachers/top_teachers_bloc.dart';
import '../widgets/teacher_card.dart';

class SearchPageScreen extends StatefulWidget {
  static String name = "Search_page";
  static String path = "/search_page";

  SearchPageScreen({super.key});

  @override
  State<SearchPageScreen> createState() => _SearchPageScreenState();
}

class _SearchPageScreenState extends State<SearchPageScreen> {
  final TextEditingController controller = TextEditingController();
  bool g = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<SearchAndFilterBloc>(),
        ),
        BlocProvider.value(
          value: getIt<TopTeachersBloc>(),
        ),
      ],
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 70.h,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 270.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          color: Theme
                              .of(context)
                              .colorScheme
                              .onPrimary,
                        ),
                        child: BlocSelector<SearchAndFilterBloc,
                            SearchAndFilterState,
                            BlocStateData<SearchModel>>(
                          selector: (state) => state.searchState,
                          builder: (context, state) {
                            return TextField(
                              onChanged: (value) {
                                context.read<SearchAndFilterBloc>().add(
                                    SearchEvent(
                                        userName: value, role: 'teacher'));
                              },
                              controller: controller,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search),
                                labelText: '',
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: lightColorScheme.onSurface),
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FilterPage()),
                              );
                            },
                            icon: Icon(
                              MdiIcons.tune,
                              size: 30.h,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onPrimary,
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocSelector<SearchAndFilterBloc,
                  SearchAndFilterState,
                  BlocStateData<SearchModel>>(
                selector: (state) => state.searchState,
                builder: (context, state) {
                  if (state.data?.users == null || state.data!.users.isEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(Images.noResults),
                        SizedBox(height: 20.h,),
                        Center(child: Text("لايوجد أساتذة")),
                      ],
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.data?.users.length,
                    itemBuilder: (context, index) {
                      final teacherName =
                          state.data?.users[index].userName ?? "";
                      final teacherLocation =
                          state.data?.users[index].locationsName ?? [];
                      final subject = state.data?.users[index].subjectName ??
                          [];
                      final img = state.data?.users[index].profilePhoto.url ??
                          "";
                      final userId = state.data?.users[index].userId ?? "";
                      return TeachersCard(
                        teacherName: teacherName,
                        location: teacherLocation.isNotEmpty
                            ? teacherLocation[0]
                            : "",
                        subject: subject.isNotEmpty ? subject[0] : "",
                        img: img,
                        onPressed: () {
                          context.read<TopTeachersBloc>().add(
                            TopTeachersByIdEvent(
                              userId: userId,
                              onSuccess: () {
                                router.pushNamed(
                                  TeachersProfileStudent.name,
                                  queryParameters: {"id": userId},
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}