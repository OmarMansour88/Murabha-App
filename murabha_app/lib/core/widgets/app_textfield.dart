import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';

class AppUniversaltextField extends StatelessWidget {
  final String? text;
  final TextStyle? hintStyle;
  final void Function(String)? onChanged;
  final Function(String?) validator;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isObscureText;
  final InputBorder? enabledBorder;
  final InputBorder? enabledFocusBorder;
  final InputBorder? errorBorder;
  final InputBorder? errorFocusBorder;
  final double? textFieldWidth;
  final double? textFieldHeight;
  final Color? filledColor;

  const AppUniversaltextField({
    super.key,
    required this.text,
    this.hintStyle,
    this.onChanged,
    required this.validator,
    this.horizontalPadding,
    this.verticalPadding,
    this.suffixIcon,
    required this.isObscureText,
    this.prefixIcon,
    this.enabledBorder,
    this.enabledFocusBorder,
    this.errorBorder,
    this.errorFocusBorder,
    this.textFieldWidth,
    this.textFieldHeight,
    this.filledColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: textFieldWidth ?? double.maxFinite,
      height: textFieldHeight ?? 50.h,
      child: TextFormField(
        onChanged: onChanged,
        validator: (value) {
          return validator(value);
        },
        decoration: InputDecoration(
          isDense: true,
          hintText: text,
          hintStyle: hintStyle ?? TextStyleManager.font14LightGreyMedium,
          enabledBorder:
              enabledBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: ColorsManager.lighterGrey),
              ),
          focusedBorder:
              enabledFocusBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: ColorsManager.lightGrey),
              ),
          errorBorder:
              errorBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.red),
              ),
          focusedErrorBorder:
              errorFocusBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.red),
              ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 20.w,
            vertical: verticalPadding ?? 15.h,
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          fillColor: filledColor ?? ColorsManager.moreLighterGrey,
          filled: true,
        ),
        obscureText: isObscureText,
      ),
    );
  }
}
