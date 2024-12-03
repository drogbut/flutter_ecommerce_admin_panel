import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.stats,
    this.icon = Iconsax.arrow_up3,
    this.color = TColors.success,
    this.onTap,
  });

  /// The main title of the card.
  final String title;

  /// The subtitle or additional description.
  final String subtitle;

  /// The price to display in the first row of the second column.
  final String stats;

  /// Callback for when the card is tapped.
  final void Function()? onTap;

  /// The icon to display in the card.
  final IconData? icon;

  /// The background color of the card.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      onTap: onTap,
      padding: const EdgeInsets.all(TSizes.lg),
      child: Column(
        children: [
          ///-- Heading
          TSectionHeading(title: title, textColor: TColors.textSecondary),
          const SizedBox(height: TSizes.spaceBtwSections),

          /// Price and Details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              /// sub-title
              Text(subtitle, style: Theme.of(context).textTheme.headlineMedium),

              /// Right side stats
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  /// Indicator
                  SizedBox(
                    child: Row(
                      children: [
                        /// Icon
                        Icon(icon, color: color, size: TSizes.iconSm),

                        /// Stats
                        Text(
                          "$stats%",
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: color,
                                overflow: TextOverflow.ellipsis,
                              ),
                        ),
                      ],
                    ),
                  ),

                  /// Compare text
                  SizedBox(
                    width: 135,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Compare to Dec 2023",
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              overflow: TextOverflow.ellipsis,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
