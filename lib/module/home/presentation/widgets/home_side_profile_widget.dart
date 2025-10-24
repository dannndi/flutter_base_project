import 'package:base_project/core/component/button/design_button.dart';
import 'package:flutter/material.dart';

import 'package:base_project/core/component/image/design_image.dart';

class DrawerProfileWidget extends StatelessWidget {
  const DrawerProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary.withOpacity(0.15),
            theme.colorScheme.surface,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatar
          DesignImage(
            NetworkAssets(
              "https://www.format.com/wp-content/uploads/portrait_of_black_man.jpg",
            ),
            height: 96,
            width: 96,
            shape: BoxShape.circle,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 12),

          // Name
          Text(
            "Ulric Rein",
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          // Bio or short description
          Text(
            "UX Designer",
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.7),
            ),
          ),

          const SizedBox(height: 16),

          // Optional action button
          DesignButton(
            onPressed: () {},
            size: DesignButtonSize.mini,
            child: (color, style) {
              return Row(
                spacing: 4,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.edit,
                    size: 18,
                    color: color,
                  ),
                  Text(
                    "Edit Profile",
                    style: style,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
