import 'package:base_project/core/component/list_tile/design_list_tile.dart';
import 'package:flutter/material.dart';

class DesignExpandableTile extends StatefulWidget {
  const DesignExpandableTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final Widget title;
  final Widget subtitle;

  @override
  State<DesignExpandableTile> createState() => _DesignExpandableTileState();
}

class _DesignExpandableTileState extends State<DesignExpandableTile> {
  final isExpandedNotifier = ValueNotifier(false);

  @override
  void dispose() {
    isExpandedNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DesignListTile(
      title: Row(
        spacing: 16,
        children: [
          Expanded(child: widget.title),
          ValueListenableBuilder(
            valueListenable: isExpandedNotifier,
            builder: (context, isExpanded, child) {
              return Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.keyboard_arrow_down_rounded,
              );
            },
          ),
        ],
      ),
      subtitle: ValueListenableBuilder(
        valueListenable: isExpandedNotifier,
        builder: (context, isExpanded, child) {
          if (!isExpanded) return const SizedBox();
          return child ?? const SizedBox();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            widget.subtitle,
          ],
        ),
      ),
      showDefaultTrailing: false,
      onTap: () {
        isExpandedNotifier.value = !isExpandedNotifier.value;
      },
    );
  }
}
