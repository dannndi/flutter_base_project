import 'package:base_project/core/component/sheet/responsive_sheet.dart';
import 'package:base_project/core/component/textfield/design_textfield.dart';
import 'package:base_project/core/extensions/build_context_ext.dart';import 'package:base_project/core/theme/app_padding.dart';
import 'package:base_project/core/theme/app_radius.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sheet/responsive_sheet.dart';

class DesignDropdown<T> extends StatefulWidget {
  const DesignDropdown({
    super.key,
    required this.textBuilder,
    this.values = const [],
    this.required = false,
    this.textEditingController,
    this.onChanged,
    this.hintText,
    this.labelText,
    this.errorText,
    this.prefix,
    this.suffix,
    this.textAlignVertical,
    this.dropdownTitle,
    this.enableSearch = false,
  });

  final bool required;
  final TextEditingController? textEditingController;
  final ValueChanged<T>? onChanged;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final Widget? prefix;
  final Widget? suffix;
  final TextAlignVertical? textAlignVertical;
  final String Function(T value) textBuilder;
  final List<T> values;
  final String? dropdownTitle;
  final bool enableSearch;

  @override
  State<DesignDropdown<T>> createState() => _DesignDropdownState<T>();
}

class _DesignDropdownState<T> extends State<DesignDropdown<T>> {
  late final TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController =
        widget.textEditingController ?? TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDropdownDialog(context),
      child: DesignTextfield(
        enabled: false,
        maxLines: 1,
        required: widget.required,
        textEditingController: textEditingController,
        labelText: widget.labelText,
        hintText: widget.hintText,
        errorText: widget.errorText,
        prefix: widget.prefix,
        suffix:
            widget.suffix ??
            Icon(
              Icons.arrow_drop_down_rounded,
              color: context.colorScheme.primary,
            ),
        textAlignVertical: widget.textAlignVertical,
      ),
    );
  }

  Future<void> _showDropdownDialog(BuildContext context) async {
    final result = await showResponsiveBottomSheet<T?>(
      context,
      typeBuilder: (context) {
        return context.responsiveValue(
          desktop: ResponsiveSheetType.dialog,
          tablet: ResponsiveSheetType.dialog,
          mobile: ResponsiveSheetType.sheet,
        );
      },
      styleBuilder: (context, type) {
        return ResponsiveSheetStyle(
          borderRadius: AppRadius.large,
          margin: 160,
        );
      },
      builder: (_, type) => ResponsiveSheet(
        type: type,
        title: widget.dropdownTitle,
        child: DropdownLayout<T>(
          values: widget.values,
          selectedText: textEditingController.text,
          dropdownTitle: widget.dropdownTitle ?? widget.labelText ?? "",
          textBuilder: widget.textBuilder,
          enableSearch: widget.enableSearch,
        ),
      ),
    );

    if (result != null) {
      widget.onChanged?.call(result);
      textEditingController.text = widget.textBuilder(result);
    }
  }
}

class DropdownLayout<T> extends StatefulWidget {
  const DropdownLayout({
    super.key,
    this.values = const [],
    this.selectedText,
    required this.dropdownTitle,
    required this.textBuilder,
    this.enableSearch = false,
  });

  final List<T> values;
  final String? selectedText;
  final String dropdownTitle;
  final String Function(T value) textBuilder;
  final bool enableSearch;

  @override
  State<DropdownLayout<T>> createState() => _DropdownStateLayout<T>();
}

class _DropdownStateLayout<T> extends State<DropdownLayout<T>> {
  final valueNotifier = ValueNotifier<List<T>>([]);
  final scrollController = ScrollController();

  @override
  void initState() {
    valueNotifier.value = widget.values;
    super.initState();
  }

  @override
  void dispose() {
    valueNotifier.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void _onSearch(String query) {
    final lower = query.toLowerCase();
    valueNotifier.value = widget.values
        .where((e) => widget.textBuilder(e).toLowerCase().contains(lower))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.enableSearch) _DropdownSearch(onSearch: _onSearch),
        Flexible(
          child: ValueListenableBuilder<List<T>>(
            valueListenable: valueNotifier,
            builder: (_, values, _) => _DropdownList<T>(
              values: values,
              selectedText: widget.selectedText,
              textBuilder: widget.textBuilder,
              controller: scrollController,
            ),
          ),
        ),
      ],
    );
  }
}

class _DropdownSearch extends StatelessWidget {
  const _DropdownSearch({required this.onSearch});

  final ValueChanged<String> onSearch;

  @override
  Widget build(BuildContext context) {
    return DesignTextfield(
      hintText: "Search",
      onChanged: onSearch,
      suffix: Icon(Icons.search),
    );
  }
}

class _DropdownList<T> extends StatelessWidget {
  const _DropdownList({
    required this.values,
    required this.selectedText,
    required this.textBuilder,
    required this.controller,
  });

  final List<T> values;
  final String? selectedText;
  final String Function(T value) textBuilder;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      controller: controller,
      thumbVisibility: true,
      thickness: 4,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.medium,
      ),
      minThumbLength: 10,
      padding: const EdgeInsets.all(0),
      child: SingleChildScrollView(
        controller: controller,
        padding: const EdgeInsets.only(right: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: List.generate(
            values.length,
            (index) {
              final value = values[index];
              final text = textBuilder(value);
              final isSelected = selectedText == text;

              return _DropdownItem<T>(
                value: value,
                text: text,
                isSelected: isSelected,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _DropdownItem<T> extends StatelessWidget {
  const _DropdownItem({
    required this.value,
    required this.text,
    required this.isSelected,
  });

  final T value;
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pop(value),
      borderRadius: AppRadius.medium,
      child: Container(
        padding: AppPadding.medium,
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).primaryColor.withValues(alpha: 0.1)
              : null,
          borderRadius: AppRadius.medium,
        ),
        child: Row(
          spacing: 8,
          children: [
            Expanded(
              child: Text(
                text,
                style: isSelected
                    ? Theme.of(context).textTheme.titleSmall
                    : Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle_rounded,
                color: context.colorScheme.primary,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
