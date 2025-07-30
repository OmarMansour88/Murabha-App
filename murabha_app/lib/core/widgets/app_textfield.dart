import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final int? maxLength;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final double? borderRadius;

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
    this.controller,
    this.keyboardType,
    this.textAlign,
    this.maxLength,
    this.inputFormatters,
    this.focusNode,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          textFieldWidth ??
          double.infinity, // ✅ This line enables width control
      height: textFieldHeight, // ✅ This line enables height control (optional)
      child: TextFormField(
        keyboardType: keyboardType ?? TextInputType.name,
        onChanged: onChanged,
        controller: controller,
        focusNode: focusNode,
        textAlign: textAlign ?? TextAlign.start,
        maxLength: maxLength ?? 255,
        inputFormatters: inputFormatters,
        validator: (value) => validator(value),
        decoration: InputDecoration(
          isDense: true,
          hintText: text,
          hintStyle: hintStyle ?? TextStyleManager.font14LightGreyMedium,
          enabledBorder:
              enabledBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
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
