import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/app_routes.dart';
import 'core/bloc_version/version_bloc.dart';
import 'core/theme/fonts.dart';
import 'features/notfications/data/data_sources/notificatioc_proccess.dart';
import 'firebase_options.dart';
import 'injection/injection.dart';
import 'l10n/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationProcess.init();
  await NotificationProcess.subscribeToTopicBasedOnRole();
  NotificationProcess.onMessage();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<VersionBloc>()..add(VersionEvent(version: 'fyt-0')),
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, builder) {
            return MaterialApp.router(
              routerConfig: router,
              theme: CustomTheme.themeData.copyWith(
                  textTheme: CustomTheme.themeData.textTheme
                      .apply(fontFamily: "Almarai-Bold")),
              darkTheme: DarkTheme.darkTheme,
              themeMode: ThemeMode.light,
              debugShowCheckedModeBanner: false,
              supportedLocales: L10n.all,
              locale: const Locale("ar"),
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
            );
          }),
    );
  }
}
