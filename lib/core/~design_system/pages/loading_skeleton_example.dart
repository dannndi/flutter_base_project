import 'package:base_project/core/component/image/design_image.dart';
import 'package:base_project/core/component/list_tile/design_list_tile.dart';
import 'package:base_project/core/component/widgets/design_theme_switch.dart';
import 'package:base_project/core/theme/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingSkeletonExample extends StatelessWidget {
  const LoadingSkeletonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loading Skeleton Example"),
        actions: [
          DesignThemeSwitch(),
          const SizedBox(width: 24),
        ],
      ),
      body: SingleChildScrollView(
        padding: AppPadding.largeHorizontal,
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Loading Skeleton Empty",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Skeletonizer.zone(
              child: DesignListTile(
                leading: Bone.circle(size: 56),
                title: Bone.text(words: 2),
                subtitle: Bone.text(),
                trailing: Bone.icon(),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Loading Skeleton From Content",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Skeletonizer(
              enabled: true,
              child: DesignListTile(
                leading: DesignImage(
                  NetworkAssets("https://dummyimage.com/600x400/000/fff"),
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
                title: Text("This is content title"),
                subtitle: Text("This is content subtitle"),
                showDefaultTrailing: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
