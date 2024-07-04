import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/bloc/app_state_bloc.dart';

class BlocStateDataBuilder<T> extends StatelessWidget {
  const BlocStateDataBuilder(
      {Key? key,
        required this.data,
        this.onLoading,
        required this.onFailed,
        this.onInit,
        required this.onSuccess})
      : super(key: key);
  final BlocStateData<T> data;
  final Widget? onLoading;

  final Widget onFailed;

  final Widget? onInit;

  final Widget Function(T? data) onSuccess;

  @override
  Widget build(BuildContext context) {
    if (data.isLoading) {
      return Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: onLoading ??
              Center(
                child: LoadingAnimationWidget.inkDrop(
                  color:  Theme.of(context).colorScheme.primary, size: 50,
                ),
              ),
        ),
      );
    }
    if (data.isFailed) {
      return onFailed;
    }
    if (data.isInit) {
      return onInit ?? const SizedBox.shrink();
    }
    return onSuccess(data.data);
  }}