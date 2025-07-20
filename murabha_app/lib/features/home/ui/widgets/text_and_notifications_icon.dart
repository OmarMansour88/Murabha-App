import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/extensions.dart';
import 'package:murabha_app/core/routing/routes.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';

class ImageandNotificationsIcon extends StatelessWidget {
  const ImageandNotificationsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi, Omar!", style: TextStyleManager.font16BlackBold),
            Text(
              "How Are you Today?",
              style: TextStyleManager.font11SimpleGreyRegular,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        CircleAvatar(
          radius: 20.r,
          backgroundColor: ColorsManager.lighterGrey,
          child: GestureDetector(
            onTap: () {
              context.pushNamed(Routes.notificationListScreen);
            },
            child: Image.asset(
              'assets/images/notification.png',
              width: 25.w,
              height: 25.h,
            ),
          ),
        ),
      ],
    );
  }
}
