import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../app_routes.dart';
import '../theme/colors.dart';

Future<T> throwAppException<T>(FutureOr<T> Function() call) async {
  try {
    return (await call());
  } on DioException catch (e) {
    showMessage(e.response?.data['message'] ?? '');
    rethrow;
  } on SocketException catch (e) {
    showMessage("No internet connection ");
    rethrow;
  } catch (e) {
    showMessage("يرجى الانتظار لحظة ");
    rethrow;
  }
}

void showMessage(String? message, {bool isSuccess = false}) {
  ScaffoldMessenger.of(router.routerDelegate.navigatorKey.currentContext!)
      .showSnackBar(SnackBar(
          backgroundColor: lightColorScheme.onSecondaryContainer,
          duration: const Duration(milliseconds: 1500),
          behavior: SnackBarBehavior.floating,
          content: Text(message ?? "Something went wrong ")));
}
