import 'package:base_project/core/component/button/design_button.dart';
import 'package:base_project/core/theme/app_color.dart';
import 'package:base_project/core/theme/app_radius.dart';
import 'package:flutter/material.dart';

enum SnackbarType {
  warning(AppColor.warning, AppColor.offWhite),
  error(AppColor.danger, AppColor.offWhite),
  success(AppColor.success, AppColor.offWhite);

  const SnackbarType(
    this.backgroundColor,
    this.foregroundColor,
  );
  final Color backgroundColor;
  final Color foregroundColor;
}

void showSnackbar(
  BuildContext context, {
  required String message,
  Widget Function(Color color)? prefix,
  Widget Function(Color color)? suffix,
  SnackbarType? type,
  bool showButton = true,
  String buttonText = "OK",
  Duration duration = const Duration(seconds: 3),
}) {
  final overlay = Navigator.of(context, rootNavigator: true).overlay;
  final theme = Theme.of(context);

  final foregroundColor =
      type?.foregroundColor ?? theme.colorScheme.onInverseSurface;

  final backgroundColor =
      type?.backgroundColor ?? theme.colorScheme.inverseSurface;

  late OverlayEntry entry;

  entry = OverlayEntry(
    builder: (context) {
      return _OverlaySnackbar(
        message: message,
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        prefix: prefix,
        suffix: suffix,
        showButton: showButton,
        buttonText: buttonText,
        onDismiss: () => entry.remove(),
      );
    },
  );

  overlay?.insert(entry);
}

class _OverlaySnackbar extends StatefulWidget {
  const _OverlaySnackbar({
    required this.message,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.onDismiss,
    this.prefix,
    this.suffix,
    required this.showButton,
    required this.buttonText,
  });

  final String message;
  final Color foregroundColor;
  final Color backgroundColor;
  final VoidCallback onDismiss;
  final Widget Function(Color)? prefix;
  final Widget Function(Color)? suffix;
  final bool showButton;
  final String buttonText;

  @override
  State<_OverlaySnackbar> createState() => _OverlaySnackbarState();
}

class _OverlaySnackbarState extends State<_OverlaySnackbar>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slide;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    slide = Tween(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeOut,
      ),
    );

    controller.forward();

    _autoDismiss();
  }

  Future<void> _autoDismiss() async {
    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
      await controller.reverse();
      widget.onDismiss();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Positioned(
      left: 16,
      right: 16,
      bottom: 24,
      child: SafeArea(
        child: SlideTransition(
          position: slide,
          child: Material(
            color: widget.backgroundColor,
            borderRadius: AppRadius.medium,
            elevation: 6,
            child: Row(
              children: [
                if (widget.prefix != null) ...[
                  const SizedBox(width: 12),
                  widget.prefix!(widget.foregroundColor),
                ],
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      widget.message,
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: widget.foregroundColor,
                      ),
                    ),
                  ),
                ),
                if (widget.suffix != null)
                  widget.suffix!(widget.foregroundColor),
                if (widget.suffix == null && widget.showButton)
                  DesignButton(
                    type: DesignButtonType.text,
                    size: DesignButtonSize.mini,
                    onPressed: () async {
                      await controller.reverse();
                      widget.onDismiss();
                    },
                    child: (_, _) => Text(
                      widget.buttonText,
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: widget.foregroundColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
