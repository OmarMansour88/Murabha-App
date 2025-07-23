import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/extensions.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/routing/routes.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/core/widgets/app_button.dart';
import 'package:murabha_app/features/login/data/models/login/login_request_body.dart';
import 'package:murabha_app/features/login/logic/login/cubit/login_cubit_cubit.dart';
import 'package:murabha_app/features/login/ui/login/widgets/login_bloc_listener.dart';
import 'package:murabha_app/features/login/ui/login/widgets/other_signin_options.dart';
import 'package:murabha_app/features/login/ui/login/widgets/terms_and_conditions.dart';
import 'package:murabha_app/features/login/ui/login/widgets/username_and_password_textfields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome,",
                  style: TextStyleManager.font24PrimaryColorBold,
                  textAlign: TextAlign.start,
                ),
                VerticalSpacing(10.h),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: TextStyleManager.font14PGreyRegular,
                ),
                VerticalSpacing(50.h),
                UsernameAndPasswordTextFields(),
                VerticalSpacing(50.h),
                AppUniversalButton(
                  onPressed: () {
                    if (context
                        .read<LoginCubit>()
                        .formKey
                        .currentState!
                        .validate()) {
                      // context.read<LoginCubit>().emitLoginState();
                      context.pushNamed(Routes.otpScreen);
                      // context.read<LoginCubit>().emitLoginState(
                      //   LoginRequestBody(
                      //     accountId: context
                      //         .read<LoginCubit>()
                      //         .emailController
                      //         .text,
                      //   ),
                      // );
                    }
                  },
                  text: "Sign In",
                  textStyle: TextStyleManager.font16WhiteSemibold,
                  width: double.maxFinite,
                  horizontalPadding: 0.h,
                ),
                VerticalSpacing(30.h),
                OtherSignInOptions(),
                VerticalSpacing(40.h),
                TermsAndConditions(),
                VerticalSpacing(20.h),
                LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
