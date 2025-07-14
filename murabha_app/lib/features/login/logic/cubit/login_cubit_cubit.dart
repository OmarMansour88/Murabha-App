import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:murabha_app/core/networking/api_result.dart';
import 'package:murabha_app/features/login/data/models/login_request_body.dart';
import 'package:murabha_app/features/login/data/repo/login_repo.dart';
import 'package:murabha_app/features/login/logic/cubit/login_cubit_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginCubitState.initial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void emitLoginState(LoginRequestBody loginRequestBody) async {
    emit(LoginCubitState.loading());
    var result = await _loginRepo.login(loginRequestBody);
    result.when(
      success: (response) {
        emit(LoginCubitState.success(response));
      },
      failure: (error) {
        emit(LoginCubitState.failure(error.apiErrorModel.message));
      },
    );
  }
}
