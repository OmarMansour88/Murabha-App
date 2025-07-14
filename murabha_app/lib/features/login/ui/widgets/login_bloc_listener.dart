import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murabha_app/core/helpers/extensions.dart';
import 'package:murabha_app/core/routing/routes.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/features/login/data/repo/login_repo.dart';
import 'package:murabha_app/features/login/logic/cubit/login_cubit_cubit.dart';
import 'package:murabha_app/features/login/logic/cubit/login_cubit_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginCubitState>(
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
          success: (LoginResponse) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          failure: (errorMessage) {
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
      child: Placeholder(),
    );
  }
}
