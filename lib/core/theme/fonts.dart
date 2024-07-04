import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class CustomTheme {
  static final ThemeData themeData = ThemeData(

    colorScheme: lightColorScheme.copyWith(
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    textTheme: TextTheme(
        titleSmall: TextStyle(
          fontSize: 18.sp,
          color: lightColorScheme.primary,
        ),
        displayLarge: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
            color: lightColorScheme.secondary),
        displaySmall:
        TextStyle(fontSize: 36.sp, color: lightColorScheme.secondary),
        headlineSmall:
        TextStyle(fontSize: 36.sp, color: lightColorScheme.secondary),
        titleLarge: TextStyle(
            fontSize: 32.sp, color: lightColorScheme.primaryContainer),
        bodyMedium: TextStyle(
            fontSize: 16.sp, color: lightColorScheme.onSurfaceVariant),
        labelMedium:
        TextStyle(fontSize: 16.sp, color: lightColorScheme.primary),
        bodyLarge: TextStyle(
          fontSize: 22.sp,
          color: lightColorScheme.secondary,
        ),
        labelSmall:
        TextStyle(fontSize: 28.sp, color: lightColorScheme.secondary),
        bodySmall: TextStyle(
          fontSize: 12.sp,
          color: lightColorScheme.secondary,
        ),
        titleMedium: TextStyle(
            fontSize: 30.sp,
            color: lightColorScheme.primary)),
    appBarTheme: AppBarTheme(
      color: lightColorScheme.background,
      iconTheme: IconThemeData(
        color: lightColorScheme.onSurface,
        size: 30,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: lightColorScheme.primaryContainer,
          elevation: 0,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: lightColorScheme.primary,
      selectedItemColor: lightColorScheme.primaryContainer,
      unselectedItemColor: lightColorScheme.onErrorContainer,
    ),
  );
}

class DarkTheme {
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme.copyWith(
      brightness: Brightness.dark,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        color: lightColorScheme.secondary,
      ),
      titleLarge: TextStyle(
        fontSize: 36.sp,
      ),
      bodyMedium: TextStyle(
        fontSize: 18.sp,
      ),
      labelMedium: TextStyle(
        fontSize: 16.sp,
      ),
      bodySmall: TextStyle(fontSize: 12.sp, color: darkColorScheme.onTertiary),
    ),
    appBarTheme: AppBarTheme(
      color: lightColorScheme.background,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            foregroundColor: lightColorScheme.primary, elevation: 4)),
  );
}
