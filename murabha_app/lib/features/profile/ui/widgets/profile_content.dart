import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/core/widgets/app_textfield.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            VerticalSpacing(20.h),
            AppUniversaltextField(
              text: 'Mohamed Amr',
              hintStyle: TextStyleManager.font10GreyRegular,
              onChanged: (value) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              isObscureText: false,
              horizontalPadding: 0.h,
            ),
            VerticalSpacing(20.h),
            AppUniversaltextField(
              text: 'Name',
              hintStyle: TextStyle(color: Colors.red),
              onChanged: (value) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              isObscureText: false,
              horizontalPadding: 0.h,
            ),
            VerticalSpacing(20.h),
            AppUniversaltextField(
              text: 'Name',
              hintStyle: TextStyle(color: Colors.red),
              onChanged: (value) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              isObscureText: false,
              horizontalPadding: 0.h,
            ),
          ],
        ),
      ),
    );
  }
}
