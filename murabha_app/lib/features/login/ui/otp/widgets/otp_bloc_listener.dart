import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murabha_app/core/helpers/extensions.dart';
import 'package:murabha_app/core/routing/routes.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/features/login/logic/otp/cubit/otp_cubit.dart';
import 'package:murabha_app/features/login/logic/otp/cubit/otp_state.dart';

class OtpBlocListener extends StatelessWidget {
  const OtpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpCubit, OtpState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Failure,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.primaryColor,
                ),
              ),
            );
          },
          success: (OtpResposeBody) {
            context.pop();
            SnackBar(
              content: Text('Login Successfully'),
              duration: Duration(seconds: 5),
            );
            context.pushNamed(Routes.homeScreen);
          },
          error: (errorMessage) {
            context.pop(); // Close the loading dialog
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: $errorMessage'),
                duration: Duration(seconds: 5),
              ),
            );
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
