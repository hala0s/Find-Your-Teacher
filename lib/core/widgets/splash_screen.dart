import 'package:find_your_teacher/core/widgets/update_version.dart';
import 'package:find_your_teacher/features/student_auth/data/data_sources/local_data_source.dart';
import 'package:find_your_teacher/features/student_home/presentation/pages/student_nav_bar.dart';
import 'package:find_your_teacher/features/teacher_home/presentation/pages/nav_bar.dart';
import 'package:find_your_teacher/onboarding_screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String name = "splash_screen";
  static String path = "/splash_screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        var s = await AuthImpLocalDataSource().getToken();
        var dd = await AuthImpLocalDataSource().isOk();
        if (s != null && dd == 'true') {
          final type = await AuthImpLocalDataSource().getRole();
          switch (type) {
            case TypeUser.student:
              if (context.mounted) {
                router.goNamed(StudentNavBarScreen.name);
              }
            case TypeUser.teacher:
              if (context.mounted) {
                router.goNamed(NavBarScreen.name);
              }
            case TypeUser.none:
              if (context.mounted) {
                router.goNamed(OnBoardContent.name);
              }
            default:
              {
                if (context.mounted) {
                  router.goNamed(OnBoardContent.name);
                }
              }
          }
        } else if (dd == 'false') {
          router.goNamed(UpdateVersion.name);
        } else {
          router.goNamed(OnBoardContent.name);
        }
      });
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: LoadingAnimationWidget.inkDrop(
        color: Theme.of(context).colorScheme.primary,
        size: 50,
      ),
    ));
  }
}
