import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/core/widgets/app_divider.dart';
import 'package:murabha_app/core/widgets/app_dropdown_list.dart';
import 'package:murabha_app/core/widgets/navigation_bar.dart';

class ApplicationForm extends StatefulWidget {
  const ApplicationForm({super.key});

  @override
  State<ApplicationForm> createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Application Form"),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpacing(20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              child: Text(
                                "1",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            VerticalSpacing(5.h),
                            Text(
                              "Bank Details",
                              style: TextStyleManager.font10GreyRegular,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 40, // adjust to your layout
                        height: 2,
                        color: Colors.grey[300], // light grey as in your image
                      ),

                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: ColorsManager.primaryColor,
                              child: Text(
                                "2",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            VerticalSpacing(5.h),
                            Text(
                              "Payment Plan",
                              style: TextStyleManager.font10GreyRegular,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 40, // adjust to your layout
                        height: 2,
                        color: Colors.grey[300], // light grey as in your image
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: Text(
                                "3",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            VerticalSpacing(5.h),
                            Text(
                              "Summary",
                              style: TextStyleManager.font10GreyRegular,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                AppUniversalDropdownList(),

                // Container(
                //   width: double.maxFinite,
                //   child: Text(
                //     "Application Form",
                //     textAlign: TextAlign.center,
                //     style: TextStyleManager.font18BlackSemiBold,
                //   ),
                // ),
                // Text("Car details"),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppUniversalBottomNavBar(),
    );
  }
}
