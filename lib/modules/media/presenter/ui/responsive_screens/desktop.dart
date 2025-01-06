import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_admin_panel/utils/constants/sizes.dart';

import '../../../../../common/styles/spacing_styles.dart';
import '../../../../../common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';

class MediaScreenDesktop extends StatelessWidget {
  const MediaScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Breadcrumbs
                TBreadcrumbsWithHeading(
                  heading: 'Media',
                  breadcrumbItems: [],
                  returnToPreviousScreen: true,
                ),

                /// upload button
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: TSizes.md, vertical: TSizes.sm)),
                  onPressed: () {},
                  label: Text(
                    'Upload images',
                  ),
                  icon: Icon(Icons.cloud),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
