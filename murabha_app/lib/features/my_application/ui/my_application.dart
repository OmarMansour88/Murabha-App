import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/core/widgets/navigation_bar.dart';
import 'package:murabha_app/features/my_application/ui/widgets/application_model.dart';

class MyApplications extends StatelessWidget {
  const MyApplications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("My Applications")),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              VerticalSpacing(20.h),
              Container(
                child: Center(
                  child: Text(
                    "My Applications",
                    style: TextStyleManager.font18BlackSemiBold,
                  ),
                ),
              ),
              VerticalSpacing(20.h),
              Expanded(
                child: Container(
                  width: double.infinity,
                  // height: double.infinity,
                  // decoration: BoxDecoration(color: Colors.red),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (int i = 0; i < 10; i++)
                          ApplicationTileModel(
                            onTap: () {},
                            // icon: Icons.ac_unit_sharp,
                            // applicationNumber: "Application1",
                            // onTap: () {},
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppUniversalBottomNavBar(index: 2),
    );
  }
}
