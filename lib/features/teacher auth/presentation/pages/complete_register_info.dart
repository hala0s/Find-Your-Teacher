import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/bloc/app_state_bloc.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/my_button.dart';
import '../../../../resources/resources.dart';
import '../../../notfications/presentation/widgets/bloc_state_data_builder.dart';
import '../../../search and filter/data/models/filter_model.dart';
import '../../../teacher_home/presentation/pages/nav_bar.dart';
import '../../data/models/complete_registrer_model.dart';
import '../manager/second_complete_profile/second_complete_profile_bloc.dart';
import '../widgets/form_field_lists.dart';

class EditRegisterInfo extends StatefulWidget {
  const EditRegisterInfo({
    super.key,
    required this.price,
    required this.aboutMe,
  });

  final int price;
  final String aboutMe;

  @override
  State<EditRegisterInfo> createState() => _EditRegisterInfoState();
}

class _EditRegisterInfoState extends State<EditRegisterInfo> {
  final TextEditingController aboutMeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  List<String> selectedSubjectIds = [];
  List<String> selectedAcademicLevelIds = [];
  List<String> selectedLocationIds = [];

  @override
  void initState() {
    priceController.text = widget.price.toString();
    aboutMeController.text = widget.aboutMe;
    super.initState();
  }

  void updateSelectedSubjectIds(List<String> ids) {
    setState(() {
      selectedSubjectIds = ids;
    });
  }

  void updateSelectedAcademicLevelIds(List<String> ids) {
    setState(() {
      selectedAcademicLevelIds = ids;
    });
  }

  void updateSelectedLocationIds(List<String> ids) {
    setState(() {
      selectedLocationIds = ids;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(15),
      child: ListView(
        children: [
          Padding(
            padding: REdgeInsets.only(right: 15.0),
            child: const Text('سعر الجلسة'),
          ),
          SizedBox(
            height: 5.h,
          ),
          PriceForm(price: priceController),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: REdgeInsets.only(right: 15.0),
            child: const Text('حول'),
          ),
          AboutMeForm(
            aboutMeController: aboutMeController,
          ),
          SizedBox(
            height: 20.h,
          ),
          BlocSelector<SecondCompleteProfileBloc, SecondCompleteProfileState,
              BlocStateData<FilterModel>>(
            selector: (state) => state.getSecondCompleteProfileState,
            builder: (context, state) {
              List<String> subjectNames = [];
              List<String> subjectIds = [];
              List<String> locationNames = [];
              List<String> locationIds = [];
              for (var subject in state.data?.subjects ?? []) {
                subjectNames.add(subject?.name ?? "");
                subjectIds.add(subject?.id ?? "");
                for (var location in state.data?.locations ?? []) {
                  locationNames.add(location?.name ?? "");
                  locationIds.add(location?.id ?? "");
                }
              }
              return BlocStateDataBuilder(
                data: state,
                onFailed: Text(
                  "failed to load data",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: lightColorScheme.secondary),
                ),
                onSuccess: (data) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: REdgeInsets.only(right: 15.0),
                      child: Text('المواد'),
                    ),
                    CardInfoForm(
                      title: "",
                      svgPicture: Images.subjectIcon,
                      dropdownValues: subjectNames,
                      dropdownValues1: subjectIds,
                      onChanged: updateSelectedSubjectIds,
                      hint: 'اختر جميع مواد تخصصك',
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: REdgeInsets.only(right: 15.0),
                      child: Text('المناطق'),
                    ),
                    CardInfoForm(
                      title: "",
                      svgPicture: Images.locationIcon,
                      dropdownValues: locationNames,
                      dropdownValues1: locationIds,
                      onChanged: updateSelectedLocationIds,
                      hint: 'اختر جميع المناطق المتواجد بها',
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    BlocSelector<SecondCompleteProfileBloc,
                        SecondCompleteProfileState, BlocStateData>(
                      selector: (state) => state.secondCompleteProfileState,
                      builder: (context, state) {
                        return Padding(
                          padding: REdgeInsets.symmetric(horizontal: 80),
                          child: MainButton(
                            isLoading: state.isLoading,
                            text: "حفظ",
                            backgroundColor: lightColorScheme.primary,
                            size: Size(200.w, 50.h),
                            onPressed: () {
                              context.read<SecondCompleteProfileBloc>().add(
                                    SecondCompleteRegisterEvent(
                                      aboutMe: aboutMeController.text.isNotEmpty
                                          ? aboutMeController.text
                                          : "لا يوجد ",
                                      subjects: selectedSubjectIds,
                                      academicLevel: selectedAcademicLevelIds,
                                      locations: selectedLocationIds,
                                      price: priceController.text.isNotEmpty &&
                                              double.tryParse(
                                                      priceController.text) !=
                                                  null
                                          ? double.parse(priceController.text)
                                              .toInt()
                                          : 0,
                                      onSuccess: () {
                                        context.goNamed(NavBarScreen.name);
                                      },
                                    ),
                                  );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
