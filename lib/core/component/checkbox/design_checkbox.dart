import 'package:flutter/material.dart';

class DesignCheckbox extends StatelessWidget {
  const DesignCheckbox({
    super.key,
    required this.value,
    this.onChanged,
  });

  final bool value;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.1,
      child: Checkbox(
        value: value,
        onChanged: onChanged,
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}
