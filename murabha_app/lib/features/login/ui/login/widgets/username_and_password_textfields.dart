import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/widgets/app_textfield.dart';
import 'package:murabha_app/features/login/logic/cubit/login_cubit_cubit.dart';

class UsernameAndPasswordTextFields extends StatefulWidget {
  UsernameAndPasswordTextFields({super.key});

  @override
  State<UsernameAndPasswordTextFields> createState() =>
      _UsernameAndPasswordTextFieldsState();
}

class _UsernameAndPasswordTextFieldsState
    extends State<UsernameAndPasswordTextFields> {
  bool isObscure = true;
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    usernameController = context.read<LoginCubit>().emailController;
    passwordController = context.read<LoginCubit>().passwordController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppUniversaltextField(
            keyboardType: TextInputType.number,
            controller: usernameController,
            text: 'CIF',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter Your Username";
              }
            },
            isObscureText: false,
          ),
          // VerticalSpacing(30.h),
          // AppUniversaltextField(
          //   controller: passwordController,
          //   text: "Password",
          //   validator: (value) {
          //     if (value == null || value.isEmpty) {
          //       return "Please Enter Your Password";
          //     }
          //   },
          //   isObscureText: isObscure,
          //   suffixIcon: GestureDetector(
          //     onTap: () {
          //       setState(() {
          //         isObscure = !isObscure;
          //       });
          //     },
          //     child: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
          //   ),
          // ),
        ],
      ),
    );
  }
}
