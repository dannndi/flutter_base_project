import 'package:base_project/core/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sheet/responsive_sheet.dart';

class FloatingActionWidget extends StatelessWidget {
  const FloatingActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showResponsiveBottomSheet(
          context,
          builder: (context, _) {
            return Container(
              width: context.screenWidth * 0.7,
              height: 600,
              alignment: Alignment.center,
              child: Text(
                "Responsive Bottomsheet",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            );
          },
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.colorScheme.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.add,
              size: 32,
              color: context.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
