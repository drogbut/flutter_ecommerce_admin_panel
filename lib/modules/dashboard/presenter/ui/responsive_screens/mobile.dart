import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_admin_panel/utils/constants/sizes.dart';

class DashboardScreenMobile extends StatelessWidget {
  const DashboardScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Header - logo, title and sub-title
              //const LoginHeader(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Form
              //const LoginForm(),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
