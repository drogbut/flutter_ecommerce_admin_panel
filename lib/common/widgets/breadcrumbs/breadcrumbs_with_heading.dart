import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';
import '../texts/page_heading.dart';
import 'breadcrumb.dart';

class TBreadcrumbsWithHeading extends StatelessWidget {
  /// The heading for the page
  final String heading;

  /// List of breadcrumb items representing the navigation path
  final List<String> breadcrumbItems;

  /// Flag to indicate whether to include the button to return to the previous screen
  final bool returnToPreviousScreen;

  const TBreadcrumbsWithHeading({
    super.key,
    required this.heading,
    required this.breadcrumbItems,
    this.returnToPreviousScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Breadcrumb trail
        TBreadcrumb(breadcrumbItems: breadcrumbItems),
        const SizedBox(height: TSizes.sm),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (returnToPreviousScreen) IconButton(onPressed: () => Get.back, icon: Icon(Iconsax.arrow_left)),
            if (returnToPreviousScreen) const SizedBox(width: TSizes.spaceBtwItems),
            TPageHeading(heading: heading),
          ],
        ),
      ],
    );
  }
}
