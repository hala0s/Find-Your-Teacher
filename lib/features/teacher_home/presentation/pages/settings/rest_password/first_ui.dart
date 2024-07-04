
import 'package:find_your_teacher/core/bloc/app_state_bloc.dart';
import 'package:find_your_teacher/core/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/widgets/textformfeild.dart';
import '../../../../../../injection/injection.dart';
import '../../../../../../resources/resources.dart';
import '../../../manager/reset_phone_number/reset_phone_number_bloc.dart';
import '../../../widgets/my_button.dart';
import 'check_your_phone.dart';

class PutPhoneNumberScreen extends StatefulWidget {
  static String name = "put_phone_number_screen";
  static String path = "/put_phone_number_screen";

  const PutPhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<PutPhoneNumberScreen> createState() => _PutPhoneNumberScreenState();
}

class _PutPhoneNumberScreenState extends State<PutPhoneNumberScreen> {
  final TextEditingController phoneNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ResetPhoneNumberBloc>(),
      child: Scaffold(
        body: SafeArea(
          child: Column(children: [
            const Spacer(),
            Text(
              'يرجى كتابة رقم الهاتف؟',
              style: Theme
                  .of(context)
                  .textTheme
                  .displayLarge,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'لإعادة تعيين كلمة المرور يجب عليك أولا ادخال رقم هاتفك',
              textAlign: TextAlign.center,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodySmall,
            ),
            SizedBox(
              height: 40.h,
            ),
            SvgPicture.asset(
              Images.putPhoneNumber,
              height: 150.h,
              width: 160.w,
            ),
            SizedBox(
              height: 80.h,
            ),
            Container(
                alignment: Alignment.topRight,
                child: Container(
                  margin: REdgeInsets.only(right: 34.w),
                  child: Text(
                    'رقم الهاتف',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium,
                  ),
                )),
            SizedBox(
              height: 9.h,
            ),
            NameField(controller: phoneNumController),
            SizedBox(
              height: 20.h,
            ),
            BlocSelector<ResetPhoneNumberBloc,
                ResetPhoneNumberState,
                BlocStateData>(
              selector: (state) => state.resetPhoneNumber,
              builder: (context, state) {
                return MyButton(
                    text: 'موافق',
                    backgroundColor: lightColorScheme.primary,
                    size: Size(317.w, 50.h),
                    onPressed: () {
                      context.read<ResetPhoneNumberBloc>().add(
                          ResetPhoneNumberEvent(
                              phoneNumber: phoneNumController.text, onSuccess: (){
                                context.pushNamed(CheckYourPhone.name);
                          }));
                    });
              },
            ),
            SizedBox(
              height: 26.h,
            ),
            Spacer()
          ]),
        ),
      ),
    );
  }
}
