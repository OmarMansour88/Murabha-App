import 'package:dio/dio.dart';
import 'package:murabha_app/core/networking/api_result.dart';
import 'package:murabha_app/core/networking/api_service.dart';
import 'package:murabha_app/features/login/data/models/otp/otp_request_body.dart';
import 'package:murabha_app/features/login/data/models/otp/otp_response_body.dart';

class OtpRepo {
  final ApiService _apiService;
  OtpRepo(this._apiService);
  Future<ApiResult<OtpResposeBody>> verifyOtp(
    OtpRequestBody otpRequestBody,
  ) async {
    try {
      var response = await _apiService.verifyOtp(otpRequestBody.otpCode);
      return ApiResult<OtpResposeBody>.success(response);
    } on DioException catch (e) {
      final error = e.response?.data;
      final errorMessage = (error is Map && error['error'] != null)
          ? error['error'].toString()
          : e.message ?? 'Unknown error';
      return ApiResult<OtpResposeBody>.failure(errorMessage);
    }
  }
}
