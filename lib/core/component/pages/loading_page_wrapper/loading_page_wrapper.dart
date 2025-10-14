import 'dart:ui';

import 'package:base_project/core/component/widgets/loading_animation.dart';
import 'package:base_project/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class LoadingPageWrapper extends StatelessWidget {
  const LoadingPageWrapper({
    super.key,
    this.isLoading = false,
    required this.child,
  });

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [child];

    if (isLoading) {
      Widget layOutProgressIndicator = const Center(
        child: LoadingAnimation(color: AppColor.white),
      );

      final modal = [
        BackdropFilter(
          filter: ImageFilter.blur(),
          child: const Opacity(
            opacity: 0.2,
            child: ModalBarrier(dismissible: false, color: AppColor.black),
          ),
        ),
        layOutProgressIndicator,
      ];

      widgetList += modal;
    }
    return Stack(children: widgetList);
  }
}
