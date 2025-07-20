import 'package:murabha_app/core/networking/api_error_handler.dart';
import 'package:murabha_app/core/networking/api_result.dart';
import 'package:murabha_app/core/networking/api_service.dart';
import 'package:murabha_app/features/login/data/models/login_request_body.dart';
import 'package:murabha_app/features/login/data/models/login_response_body.dart';

class LoginRepo {
  final ApiService _apiService;
  LoginRepo(this._apiService);
  Future<ApiResult<LoginResponse>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      var response = await _apiService.login(loginRequestBody.accountId);
      return ApiResult<LoginResponse>.success(response);
    } catch (e) {
      return ApiResult<LoginResponse>.failure(e.toString());
    }
  }
}
