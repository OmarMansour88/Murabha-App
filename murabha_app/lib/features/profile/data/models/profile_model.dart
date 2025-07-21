import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';

class ProfileModel extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileModel({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 65.h, // Adjust height as needed
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.r), // Optional: rounded corners
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.2.w),
            bottom: BorderSide(color: Colors.grey, width: 0.2.w),
            left: BorderSide(color: Colors.grey, width: 0.2.w),
            right: BorderSide(color: Colors.grey, width: 0.2.w),
          ),
        ),

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: Row(
            children: [
              Icon(icon, size: 24.sp, color: ColorsManager.primaryColor),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 14.sp, color: Colors.black),
                ),
              ),
              Icon(Icons.chevron_right, size: 24.sp, color: Colors.grey[700]),
            ],
          ),
        ),
      ),
    );
  }
}
