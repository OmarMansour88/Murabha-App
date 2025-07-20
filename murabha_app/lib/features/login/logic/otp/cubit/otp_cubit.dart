import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:murabha_app/core/networking/api_result.dart';
import 'package:murabha_app/features/login/data/models/otp/otp_request_body.dart';
import 'package:murabha_app/features/login/data/models/otp/otp_response_body.dart';
import 'package:murabha_app/features/login/data/repo/otp/otp_repo.dart';
import 'package:murabha_app/features/login/logic/otp/cubit/otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final OtpRepo _otpRepo;
  OtpCubit(this._otpRepo) : super(OtpState.initial());
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  static String concatinateOtpFields(List<TextEditingController> controllers) {
    var otpCode = "";
    for (var i in controllers) {
      otpCode += i.text;
    }
    return otpCode;
  }

  void emitOtpState() async {
    emit(OtpState.loading());
    var otpCode = concatinateOtpFields(controllers);
    var result = await _otpRepo.verifyOtp(OtpRequestBody(otpCode: otpCode));
    result.when(
      success: (response) {
        emit(OtpState.success(response));
      },
      failure: (error) {
        emit(OtpState.error(error));
      },
    );
  }
}
