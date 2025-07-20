import 'package:dio/dio.dart';
import 'package:murabha_app/core/networking/api_constants.dart';
import 'package:murabha_app/features/login/data/models/login/login_response_body.dart';
import 'package:murabha_app/features/login/data/models/otp/otp_response_body.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.login)
  Future<LoginResponse> login(@Query('accountId') String accountId);
  @GET(ApiConstants.otp)
  Future<OtpResposeBody> verifyOtp(@Query('otpCode') String otpCode);

  // @POST(ApiConstants.signup)
  // Future<SignupResponseBody> signup(
  //   @Body() SignupRequestBody signupRequestBody,
  // );
}
