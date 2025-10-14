import 'package:base_project/core/component/image/design_image.dart';
import 'package:flutter/material.dart';

class HomeTopProfileWidget extends StatelessWidget {
  const HomeTopProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(42),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(42),
          border: Border.all(),
        ),

        child: Row(
          children: [
            DesignImage(
              NetworkAssets(
                "https://www.format.com/wp-content/uploads/portrait_of_black_man.jpg",
              ),
              height: 42,
              width: 42,
              shape: BoxShape.circle,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                "Ulric Rein",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
