import 'package:base_project/core/component/textfield/design_dropdown.dart';
import 'package:base_project/core/component/widgets/design_theme_switch.dart';
import 'package:base_project/core/theme/app_padding.dart';
import 'package:flutter/material.dart';

class DropdownExamplePage extends StatelessWidget {
  const DropdownExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dropdown Example"),
        actions: [
          DesignThemeSwitch(),
          const SizedBox(width: 24),
        ],
      ),
      body: SingleChildScrollView(
        padding: AppPadding.largeHorizontal,
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DesignDropdown(
              values: ["One", "Two", "Three"],
              textBuilder: (value) => value,
              labelText: "Dropdown",
              hintText: "Selected value",
            ),
            DesignDropdown(
              values: List.generate(40, (index)=>"Item $index"),
              textBuilder: (value) => value,
              labelText: "Long List Dropdown",
              hintText: "Selected value",
            ),
            DesignDropdown(
              values: ["One", "Two", "Three"],
              enableSearch: true,
              textBuilder: (value) => value,
              labelText: "Dropdown with Search",
              hintText: "Selected value",
            ),
            DesignDropdown(
              values: List.generate(40, (index)=>"Item $index"),
              enableSearch: true,
              textBuilder: (value) => value,
              labelText: "Long List Dropdown with Search",
              hintText: "Selected value",
            ),
            DesignDropdown(
              values: ["One", "Two", "Three"],
              textBuilder: (value) => value,
              labelText: "Dropdown with Title",
              dropdownTitle: "Pick your value",
              hintText: "Selected value",
            ),
            DesignDropdown(
              values: List.generate(40, (index)=>"Item $index"),
              textBuilder: (value) => value,
              labelText: "Long List Dropdown with Title",
              dropdownTitle: "Pick your value",
              hintText: "Selected value",
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
