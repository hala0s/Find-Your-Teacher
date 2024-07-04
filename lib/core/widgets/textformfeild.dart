import 'package:find_your_teacher/core/theme/colors.dart';
import 'package:find_your_teacher/core/theme/fonts.dart';
import 'package:find_your_teacher/features/search%20and%20filter/presentation/manager/search_with_filter/search_and_filter_bloc.dart';
import 'package:find_your_teacher/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../features/search and filter/data/models/search_model.dart';
import '../../features/search and filter/presentation/pages/filter_page.dart';
import '../../features/student_home/presentation/pages/search_page_screen.dart';
import '../bloc/app_state_bloc.dart';

class CalenderFormField extends StatefulWidget {
  final TextEditingController controller;
  final IconData icon;

  const CalenderFormField({
    super.key,
    required this.controller,
    required this.icon,
  });

  @override
  State<CalenderFormField> createState() => _CalenderFormFieldState();
}

class _CalenderFormFieldState extends State<CalenderFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.w,
      height: 53.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.white,
        border: Border.all(color: Colors.white),
      ),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              contentPadding: REdgeInsetsDirectional.all(12),
              border: InputBorder.none,
              fillColor: Colors.white,
            ),
            readOnly: true,
          ),
          IconButton(
            icon: Icon(widget.icon),
            onPressed: () {
              selectDate();
            },
          ),
        ],
      ),
    );
  }

  Future<ThemeData> selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    if (picked != null) {
      setState(() {
        widget.controller.text = picked.toString().split(" ")[0];
      });
    }
    return CustomTheme.themeData.copyWith(
      primaryColor: lightColorScheme.onSecondaryContainer,
      dialogBackgroundColor: lightColorScheme.background,
    );
  }
}

class NameField extends StatelessWidget {
  final TextEditingController controller;

  const NameField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsetsDirectional.only(start: 30.0, end: 30.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.white,
          border: Border.all(color: Colors.white),
        ),
        child: TextFormField(
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: Theme.of(context).colorScheme.secondary,
          textAlign: TextAlign.start,
          validator: (value) {
            if (value == null || value.isEmpty) {
              'يرجى كتابة الاسم';
            }
            return null;
          },
          controller: controller,
          obscureText: false,
          decoration: InputDecoration(
            contentPadding: REdgeInsetsDirectional.all(5),
            border: InputBorder.none,
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

class PhoneNumField extends StatelessWidget {
  final TextEditingController controller;

  const PhoneNumField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? _phoneValidation(value) {
      if (value == null || value!.isEmpty) {
        return 'يرجى تعبئة رقم الهاتف';
      } else if (value.length != 10) {
        return 'يرجى كتابة رقم الهاتف من 10 خانات';
      } else if (value.toString().substring(0, 2) != '09') {
        return 'ادخل رقم صالح';
      }
      return null;
    }

    return Padding(
      padding: REdgeInsetsDirectional.only(start: 30.0, end: 30.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.white,
          border: Border.all(color: Colors.white),
        ),
        child: TextFormField(
          keyboardType: TextInputType.phone,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: Theme.of(context).colorScheme.secondary,
          textAlign: TextAlign.start,
          validator: _phoneValidation,
          controller: controller,
          obscureText: false,
          decoration: InputDecoration(
            contentPadding: REdgeInsetsDirectional.all(12),
            border: InputBorder.none,
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

class PassTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController? otherController;

  const PassTextField({
    Key? key,
    required this.controller,
    this.otherController,
  }) : super(key: key);

  @override
  State<PassTextField> createState() => _PassTextFieldState();
}

class _PassTextFieldState extends State<PassTextField> {
  String? _passValidation(value) {
    if (value!.isEmpty) {
      return ' يرجى كتابة كلمة المرور';
    }
    if (value.length < 8) {
      return 'يرجى كتابة كلمة المرور بما لايقل عن 8 خانات ';
    }
    if (widget.otherController != null &&
        widget.otherController?.text != widget.controller.text) {
      return "كلمة المرور غير متطابقة";
    }
    return null;
  }

  bool? passwordVisible;

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsetsDirectional.only(start: 30.0, end: 30.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.white,
          border: Border.all(color: Colors.white),
        ),
        child: TextFormField(
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: Theme.of(context).colorScheme.secondary,
          validator: _passValidation,
          controller: widget.controller,
          obscureText: !passwordVisible!,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                passwordVisible! ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  passwordVisible = !passwordVisible!;
                });
              },
            ),
            contentPadding: REdgeInsetsDirectional.all(15),
            border: InputBorder.none,
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

class CompleteRegisterField extends StatelessWidget {
  final TextEditingController controller;
  final bool enable;

  const CompleteRegisterField(
      {Key? key, required this.controller, required this.enable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 53.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 25),
        child: TextFormField(
          enabled: enable,
          decoration: InputDecoration(
            contentPadding: REdgeInsetsDirectional.all(5),
            border: InputBorder.none,
            fillColor: Colors.white,
          ),
          cursorColor: Theme.of(context).colorScheme.secondary,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '';
            }
            return null;
          },
          controller: controller,
        ),
      ),
    );
  }
}

class StudentSearchBar extends StatelessWidget {
  StudentSearchBar({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<SearchAndFilterBloc>(),
      child: Padding(
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
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  child: BlocSelector<SearchAndFilterBloc, SearchAndFilterState,
                      BlocStateData<SearchModel>>(
                    selector: (state) => state.searchState,
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          context.pushNamed(SearchPageScreen.name);
                        },
                        child: TextField(
                          enabled: false,
                          // onChanged: (value) {
                          //   context.read<SearchAndFilterBloc>().add(
                          //       SearchEvent(userName: value, role: 'teacher'));
                          // },
                          // controller: controller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(MdiIcons.magnify),
                            labelText: '',
                          ),
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
                        context.pushNamed(FilterPage.name);
                      },
                      icon: Icon(
                        MdiIcons.tune,
                        size: 30.h,
                        color: Theme.of(context).colorScheme.onPrimary,
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
