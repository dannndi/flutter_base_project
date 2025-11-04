import 'package:base_project/core/component/image/design_image.dart';
import 'package:base_project/core/component/widgets/design_theme_switch.dart';
import 'package:base_project/core/theme/app_padding.dart';
import 'package:flutter/material.dart';

class ImageExamplePage extends StatelessWidget {
  const ImageExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch Example"),
        actions: [
          DesignThemeSwitch(),
          const SizedBox(width: 24),
        ],
      ),
      body: SingleChildScrollView(
        padding: AppPadding.largeHorizontal,
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Network Image",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            DesignImage(
              NetworkAssets("https://dummyimage.com/600x400/000/fff"),
              fit: BoxFit.cover,
            ),
            AspectRatio(
              aspectRatio: 1,
              child: DesignImage(
                NetworkAssets("https://dummyimage.com/500x500/000/fff"),
                fit: BoxFit.cover,
              ),
            ),
            Text(
              "Network Image (error default)",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: DesignImage(
                NetworkAssets("https://dummyimage.coa"),
                fit: BoxFit.cover,
              ),
            ),
            Text(
              "Network Image (error custom)",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: DesignImage(
                NetworkAssets("https://dummyimage.coa"),
                failedWidget: Container(
                  color: Colors.red,
                  child: Icon(Icons.close),
                ),
              ),
            ),
            const SizedBox(height: 72),
          ],
        ),
      ),
    );
  }
}
