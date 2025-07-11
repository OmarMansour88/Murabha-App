import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';

class AppUniversalButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? width;
  final double? height;
  final String text;
  final TextStyle? textStyle;

  const AppUniversalButton({
    super.key,
    required this.onPressed,
    this.child,
    this.backgroundColor,
    this.borderRadius,
    this.horizontalPadding,
    this.verticalPadding,
    this.width,
    this.height,
    required this.text,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? 20.w,
        vertical: verticalPadding ?? 10.h,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
            backgroundColor ?? ColorsManager.primaryColor,
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16.sp),
            ),
          ),
          // padding: WidgetStateProperty.all<EdgeInsets>(
          //   EdgeInsets.symmetric(
          //     horizontal: horizontalPadding ?? 20.w,
          //     vertical: verticalPadding ?? 10.h,
          //   ),
          // ),
          fixedSize: WidgetStateProperty.all<Size>(
            Size(width ?? double.maxFinite, height ?? 50.h),
          ),
        ),

        onPressed: onPressed,
        child:
            child ??
            Text(
              text,
              style: textStyle ?? TextStyleManager.font16WhiteSemibold,
            ),
      ),
    );
  }
}
