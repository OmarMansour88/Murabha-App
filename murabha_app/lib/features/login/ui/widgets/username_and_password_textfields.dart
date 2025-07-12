import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/widgets/app_textfield.dart';

class UsernameAndPasswordTextFields extends StatefulWidget {
  UsernameAndPasswordTextFields({super.key});

  @override
  State<UsernameAndPasswordTextFields> createState() =>
      _UsernameAndPasswordTextFieldsState();
}

class _UsernameAndPasswordTextFieldsState
    extends State<UsernameAndPasswordTextFields> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppUniversaltextField(
          text: 'Username',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your Username";
            }
          },
          isObscureText: false,
        ),
        VerticalSpacing(30.h),
        AppUniversaltextField(
          text: "Password",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your Password";
            }
          },
          isObscureText: isObscure,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
            child: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
          ),
        ),
      ],
    );
  }
}
