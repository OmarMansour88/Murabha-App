import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/features/profile/data/models/profile_model.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      children: [
        ProfileModel(
          icon: Icons.shopping_bag_outlined,
          title: 'My Purchases',
          onTap: () {
            // Navigate to purchases
          },
        ),
        SizedBox(height: 12.h),
        ProfileModel(
          icon: Icons.star_rate_outlined,
          title: 'Rating & Feedback',
          onTap: () {
            // Open rating screen
          },
        ),
        SizedBox(height: 12.h),
        ProfileModel(
          icon: Icons.description_outlined,
          title: 'Terms & Conditions',
          onTap: () {
            // Open terms
          },
        ),
        SizedBox(height: 12.h),
        ProfileModel(
          icon: Icons.privacy_tip_outlined,
          title: 'Privacy & Policies',
          onTap: () {
            // Open privacy
          },
        ),
        SizedBox(height: 12.h),
        ProfileModel(
          icon: Icons.language_outlined,
          title: 'Language',
          onTap: () {
            // Change language
          },
        ),
        SizedBox(height: 12.h),
        ProfileModel(
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
