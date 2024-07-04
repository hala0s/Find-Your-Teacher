import 'dart:io';
import 'package:find_your_teacher/core/bloc/app_state_bloc.dart';
import 'package:find_your_teacher/core/theme/colors.dart';
import 'package:find_your_teacher/core/widgets/my_button.dart';
import 'package:find_your_teacher/features/teacher_home/presentation/pages/nav_bar.dart';
import 'package:find_your_teacher/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import '../../../../../core/widgets/textformfeild.dart';
import '../../../../../resources/resources.dart';
import '../../../../student_auth/data/data_sources/local_data_source.dart';
import '../../../../teacher auth/presentation/manager/comple_teacher_profile_1/complete_teacher_profile1_bloc.dart';
import '../../../../teacher auth/presentation/pages/complete_register2.dart';

class EditTeacherProfile extends StatefulWidget {
  static String name = "edit_teacher_profile";
  static String path = "/edit_teacher_profile";

  const EditTeacherProfile({super.key});

  @override
  State<EditTeacherProfile> createState() => _EditTeacherProfileState();
}

class _EditTeacherProfileState extends State<EditTeacherProfile> {
  final TextEditingController fullName = TextEditingController(text: '');
  final TextEditingController dateOfBirth = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  final MultiSelectController location = MultiSelectController();

  File? _image;
  String? select;
  File? selectedIMage;

  void _loadInitialData() async {
    String? username = await AuthImpLocalDataSource().getName();
    String? phoneteacherNumber =
        await AuthImpLocalDataSource().getPhoneNumber();
    if (mounted) {
      setState(() {
        fullName.text = username ?? '';
        phoneNumber.text = phoneteacherNumber ?? '';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CompleteTeacherProfile1Bloc>(),
      child: Scaffold(
        body: Padding(
          padding: REdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  _image != null
                      ? Align(
                          alignment: Alignment.topCenter,
                          child: CircleAvatar(
                            radius: 55,
                            backgroundImage: FileImage(_image!),
                          ),
                        )
                      : const Align(
                          alignment: Alignment.topCenter,
                          child: CircleAvatar(
                            radius: 55,
                            backgroundImage: NetworkImage(
                                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                          ),
                        ),
                  Positioned(
                    right: 0,
                    bottom: -21,
                    left: 59,
                    child: GestureDetector(
                      onTap: () {
                        showImagePickerOption(context);
                      },
                      child: SvgPicture.asset(Images.imageEdit),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'الاسم الكامل',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: 15.h,
              ),
              CompleteRegisterField(
                controller: fullName,
                enable: true,
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                  child: Text(
                'تاريخ الميلاد',
                style: Theme.of(context).textTheme.bodyMedium,
              )),
              SizedBox(
                height: 15.h,
              ),
              CalenderFormField(
                  controller: dateOfBirth, icon: Icons.calendar_today_outlined),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'الجنس',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                height: 40.h,
                child: Row(
                  children: [
                    addRadioButton(
                        0, 'ذكر', Theme.of(context).textTheme.bodySmall),
                    SizedBox(
                      width: 100.w,
                    ),
                    addRadioButton(
                        1, 'انثى', Theme.of(context).textTheme.bodySmall)
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'رقم الهاتف',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: 15.h,
              ),
              CompleteRegisterField(
                controller: phoneNumber,
                enable: false,
              ),
              SizedBox(
                height: 50.h,
              ),
              BlocSelector<CompleteTeacherProfile1Bloc,
                  CompleteTeacherProfile1State, BlocStateData>(
                selector: (state) => state.completeTeacherProfile1,
                builder: (context, state) {
                  return Align(
                    alignment: AlignmentDirectional.center,
                    child: MainButton(
                      onPressed: () async {
                        if (fullName.text.isEmpty ||
                            select == null ||
                            dateOfBirth.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('يرجى تعبئة جميع الحقول مع'),
                            ),
                          );
                        } else {
                          context
                              .read<CompleteTeacherProfile1Bloc>()
                              .add(CompleteTeacherProfile1Event(
                                teacherName: fullName.text,
                                teacherImage: _image,
                                teacherGender: select,
                                teacherDateBirth: dateOfBirth.text,
                                onSuccess: () {
                                  context.pushNamed(NavBarScreen.name);
                                },
                              ));
                          AuthImpLocalDataSource().saveName(fullName.text);
                        }
                      },
                      isLoading: state.isLoading,
                      text: 'حفظ',
                      backgroundColor: lightColorScheme.primary,
                      size: Size(200, 50),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.blue[100],
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.5,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 70,
                            ),
                            Text("Gallery")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 70,
                            ),
                            Text("Camera")
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> selectDate() async {
    await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
  }

//Gallery
  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path);
    });
    Navigator.of(context).pop(); //close the model sheet
  }

//Camera
  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path);
    });
    Navigator.of(context).pop();
  }

  Row addRadioButton(int btnValue, String title, [TextStyle? bodySmall]) {
    List gender = ['male', 'female'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).colorScheme.onSurface,
          value: gender[btnValue],
          groupValue: select,
          onChanged: (value) {
            setState(() {
              select = value;
            });
          },
        ),
        Text(title)
      ],
    );
  }
}
