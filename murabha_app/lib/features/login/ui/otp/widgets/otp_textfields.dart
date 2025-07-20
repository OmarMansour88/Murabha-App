import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/widgets/app_textfield.dart';

class OtpTextfields extends StatefulWidget {
  const OtpTextfields({super.key});

  @override
  State<OtpTextfields> createState() => _OtpTextfieldsState();
}

class _OtpTextfieldsState extends State<OtpTextfields> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 50.w,
            child: AppUniversaltextField(
              text: " ",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "";
                }
              },
              isObscureText: false,
              filledColor: Colors.white,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              enabledFocusBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              errorFocusBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          HorizontalSpacing(10.w),
          Container(
            width: 50.w,
            child: AppUniversaltextField(
              text: " ",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "";
                }
              },
              isObscureText: false,
              filledColor: Colors.white,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              enabledFocusBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              errorFocusBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          HorizontalSpacing(10.w),
          Container(
            width: 50.w,
            child: AppUniversaltextField(
              text: " ",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "";
                }
              },
              isObscureText: false,
              filledColor: Colors.white,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              enabledFocusBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              errorFocusBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          HorizontalSpacing(10.w),
          Container(
            width: 50.w,
            child: AppUniversaltextField(
              text: " ",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "";
                }
              },
              isObscureText: false,
              filledColor: Colors.white,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              enabledFocusBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              errorFocusBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          // HorizontalSpacing(10.w),
        ],
      ),
    );
  }
}
