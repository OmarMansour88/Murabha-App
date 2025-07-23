import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/core/widgets/app_button.dart';
import 'package:murabha_app/core/widgets/app_textfield.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              VerticalSpacing(20.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Text(
                    'Name :',
                    style: TextStyleManager.font14BlackRegular,
                  ),
                ),
              ),
              VerticalSpacing(5.h),
              AppUniversaltextField(
                maxLength: 20,
                textFieldWidth: 350.w,
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
                horizontalPadding: 20.h,
              ),
              VerticalSpacing(20.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Text(
                    'Phone :',
                    style: TextStyleManager.font14BlackRegular,
                  ),
                ),
              ),
              VerticalSpacing(5.h),
              AppUniversaltextField(
                textFieldWidth: 350.w,
                maxLength: 13,
                text: '+20 123 456 7890',
                hintStyle: TextStyleManager.font10GreyRegular,
                onChanged: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                isObscureText: false,
                horizontalPadding: 20.h,
                // verticalPadding: 20.0.w,
              ),
              VerticalSpacing(20.h),
              AppUniversalButton(
                onPressed: () {
                  // Handle save action
                },
                text: 'Save',
                backgroundColor: ColorsManager.primaryColor,
                borderRadius: 16.sp,
                horizontalPadding: 20.w,
                verticalPadding: 10.h,
                width: 350.w,
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
