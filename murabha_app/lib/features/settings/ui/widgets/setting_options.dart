import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/extensions.dart';
import 'package:murabha_app/core/routing/routes.dart';
import 'package:murabha_app/features/settings/data/models/setting_model.dart';

class SettingOptions extends StatelessWidget {
  const SettingOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      children: [
        SettingModel(
          icon: Icons.shopping_bag_outlined,
          title: 'My Purchases',
          onTap: () {
            // Navigate to purchases
          },
        ),
        SizedBox(height: 12.h),
        SettingModel(
          icon: Icons.star_rate_outlined,
          title: 'Rating & Feedback',
          onTap: () {
            context.pushNamed(Routes.ratingAndFeedbackScreen);
          },
        ),
        SizedBox(height: 12.h),
        SettingModel(
          icon: Icons.description_outlined,
          title: 'Terms & Conditions',
          onTap: () {
            // Open terms
          },
        ),
        SizedBox(height: 12.h),
        SettingModel(
          icon: Icons.privacy_tip_outlined,
          title: 'Privacy & Policies',
          onTap: () {
            // Open privacy
          },
        ),
        SizedBox(height: 12.h),
        SettingModel(
          icon: Icons.language_outlined,
          title: 'Language',
          onTap: () {
            // Change language
          },
        ),
        SizedBox(height: 12.h),
        SettingModel(
          icon: Icons.logout_outlined,
          title: 'Logout',
          onTap: () {
            // Log out
          },
        ),
      ],
    );
  }
}
