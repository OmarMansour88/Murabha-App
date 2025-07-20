import 'package:dio/dio.dart';
import "package:murabha_app/core/networking/api_result.dart";
import 'package:murabha_app/core/networking/api_service.dart';
import 'package:murabha_app/features/login/data/models/login/login_request_body.dart';
import 'package:murabha_app/features/login/data/models/login/login_response_body.dart';

class LoginRepo {
  final ApiService _apiService;
  LoginRepo(this._apiService);
  Future<ApiResult<LoginResponse>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      var response = await _apiService.login(loginRequestBody.accountId);
      return ApiResult<LoginResponse>.success(response);
    } on DioException catch (e) {
      final error = e.response?.data;
      final errorMessage = (error is Map && error['error'] != null)
          ? error['error'].toString()
          : e.message ?? 'Unknown error';
      return ApiResult<LoginResponse>.failure(errorMessage);
    }
  }
}
