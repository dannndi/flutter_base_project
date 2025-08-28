import 'package:base_project/core/component/button/design_button.dart';
import 'package:base_project/core/component/image/design_image.dart';
import 'package:base_project/core/component/textfield/design_textfield.dart';
import 'package:base_project/core/theme/app_color.dart';
import 'package:base_project/core/theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileUI();
  }
}

class ProfileUI extends StatefulWidget {
  const ProfileUI({super.key});

  @override
  State<ProfileUI> createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Design System")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textThemeSample(context),
            Divider(height: 64),
            designButtonSample(context),
            Divider(height: 64),
            DesignTextfield(
              labelText: "Outlined Input Border",
              hintText: "Type here ....",
              errorText: "Error message",
              prefix: Icon(Icons.email),
              suffix: Icon(Icons.send, color: AppColor.black),
              maxLines: 1,
            ),
            const SizedBox(height: 8),
            DesignTextfield(
              type: DesignTextfieldType.underline,
              labelText: "Underline Input Border",
              hintText: "Type here ....",
              errorText: "Error message",
              prefix: Icon(Icons.email),
              suffix: Icon(Icons.send, color: AppColor.black),
              maxLines: 1,
            ),
            const SizedBox(height: 8),
            DesignTextfield(
              type: DesignTextfieldType.none,
              labelText: "No Input Border",
              hintText: "Type here ....",
              errorText: "Error message",
              prefix: Icon(Icons.email),
              suffix: Icon(Icons.send, color: AppColor.black),
              maxLines: 1,
            ),
            const SizedBox(height: 8),
            AspectRatio(
              aspectRatio: 6 / 4,
              child: DesignImage(NetworkAssets("https://broken-url")),
            ),
            DesignImage(
              NetworkAssets("https://dummyimage.com/600x400/000/fff"),
            ),
            const SizedBox(height: 64),
          ],
        ),
      ),
    );
  }
}
