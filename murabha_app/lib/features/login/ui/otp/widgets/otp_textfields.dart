import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/widgets/app_textfield.dart';
import 'package:murabha_app/features/login/logic/otp/cubit/otp_cubit.dart';

class OtpTextfields extends StatefulWidget {
  const OtpTextfields({super.key});

  @override
  State<OtpTextfields> createState() => _OtpTextfieldsState();
}

class _OtpTextfieldsState extends State<OtpTextfields> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    _focusNodes = context.read<OtpCubit>().focusNodes;
    _controllers = context.read<OtpCubit>().controllers;
    super.initState();
  }

  @override
  void dispose() {
    for (var fn in _focusNodes) {
      fn.dispose();
    }
    for (var c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.length == 1 && index < _focusNodes.length - 1) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    }
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<OtpCubit>().formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...List.generate(4, (index) {
              return Container(
                width: 50.w,
                child: AppUniversaltextField(
                  text: " ",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "";
                    }
                  },
                  focusNode: _focusNodes[index],
                  controller: _controllers[index],
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) => _onChanged(value, index),
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
              );
            }),
          ],
        ),

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     Container(
        //       width: 50.w,
        //       child: AppUniversaltextField(
        //         text: " ",
        //         validator: (value) {
        //           if (value == null || value.isEmpty) {
        //             return "";
        //           }
        //         },
        //         isObscureText: false,
        //         filledColor: Colors.white,
        //         enabledBorder: UnderlineInputBorder(
        //           borderSide: BorderSide(color: Colors.black),
        //         ),
        //         enabledFocusBorder: UnderlineInputBorder(
        //           borderSide: BorderSide(color: Colors.black),
        //         ),
        //         errorBorder: UnderlineInputBorder(
        //           borderSide: BorderSide(color: Colors.black),
        //         ),
        //         errorFocusBorder: UnderlineInputBorder(
        //           borderSide: BorderSide(color: Colors.black),
        //         ),
        //       ),
        //     ),
        //     HorizontalSpacing(10.w),
        //     Container(
        //       width: 50.w,
        //       child: AppUniversaltextField(
        //         text: " ",
        //         validator: (value) {
        //           if (value == null || value.isEmpty) {
        //             return "";
        //           }
        //         },
        //         isObscureText: false,
        //         filledColor: Colors.white,
        //         enabledBorder: UnderlineInputBorder(
        //           borderSide: BorderSide(color: Colors.black),
        //         ),
        //         enabledFocusBorder: UnderlineInputBorder(
        //           borderSide: BorderSide(color: Colors.black),
        //         ),
        //         errorBorder: UnderlineInputBorder(
        //           borderSide: BorderSide(color: Colors.black),
        //         ),
        //         errorFocusBorder: UnderlineInputBorder(
        //           borderSide: BorderSide(color: Colors.black),
        //         ),
        //       ),
        //     ),
        //     HorizontalSpacing(10.w),
        //     Container(
        //       width: 50.w,
        //       child: AppUniversaltextField(
        //         text: " ",
        //         validator: (value) {
        //           if (value == null || value.isEmpty) {
        //             return "";
        //           }
        //         },
        //         isObscureText: false,
        //         filledColor: Colors.white,
        //         enabledBorder: UnderlineInputBorder(
        //           borderSide: BorderSide(color: Colors.black),
        //         ),
        //         enabledFocusBorder: UnderlineInputBorder(
        //           borderSide: BorderSide(color: Colors.black),
        //         ),
        //         errorBorder: UnderlineInputBorder(
        //           borderSide: BorderSide(color: Colors.black),
        //         ),
        //         errorFocusBorder: UnderlineInputBorder(
        //           borderSide: BorderSide(color: Colors.black),
        //         ),
        //       ),
        //     ),
        //     HorizontalSpacing(10.w),
        //     Container(
        //       width: 50.w,
        //       child: AppUniversaltextField(
        //         text: " ",
        //         validator: (value) {
        //           if (value == null || value.isEmpty) {
        //             return "";
        //           }
        //         },
        //         isObscureText: false,
        //         filledColor: Colors.white,
        //         enabledBorder: UnderlineInputBorder(
        //           borderSide: BorderSide(color: Colors.black),
        //         ),
        //         enabledFocusBorder: UnderlineInputBorder(
        //           borderSide: BorderSide(color: Colors.black),
        //         ),
        //         errorBorder: UnderlineInputBorder(
        //           borderSide: BorderSide(color: Colors.black),
        //         ),
        //         errorFocusBorder: UnderlineInputBorder(
        //           borderSide: BorderSide(color: Colors.black),
        //         ),
        //       ),
        //     ),
        //     // HorizontalSpacing(10.w),
        //   ],
        // ),
      ),
    );
  }
}
