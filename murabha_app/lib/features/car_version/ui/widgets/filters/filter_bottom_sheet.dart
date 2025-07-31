import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/core/widgets/app_button.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.85,
      builder: (_, controller) => Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            VerticalSpacing(16.h),
            Text("Filters", style: TextStyleManager.font18BlackSemiBold),
            VerticalSpacing(20.h),
            Expanded(
              child: ListView(
                controller: controller,
                children: [
                  FilterCategory(
                    title: 'Make & Model',
                    options: [
                      'BMW',
                      'Chevrolet',
                      'Kia',
                      'Hyundai',
                      'Jeep',
                      'Ford',
                      'Fiat',
                      'Citroen',
                      'Chery',
                    ],
                  ),
                  // Add other filter categories here: Year, Price, Kilometers...
                ],
              ),
            ),
            VerticalSpacing(16.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Clear All",
                      style: TextStyleManager.font14RedBold,
                    ),
                  ),
                ),
                HorizontalSpacing(10.w),
                Expanded(
                  child: AppUniversalButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Trigger cubit filter here
                    },
                    text: "Show 78 Cars",
                    backgroundColor: ColorsManager.primaryColor,
                    textStyle: TextStyleManager.font14WhiteRegular,
                    horizontalPadding: 2.w,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FilterCategory extends StatelessWidget {
  final String title;
  final List<String> options;

  const FilterCategory({super.key, required this.title, required this.options});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title, style: TextStyleManager.font14BlackRegular),
      children: options
          .map(
            (option) => CheckboxListTile(
              value: false, // Should be managed by Cubit
              onChanged: (val) {},
              title: Text(option),
            ),
          )
          .toList(),
    );
  }
}
