import 'package:json_annotation/json_annotation.dart';
part 'otp_request_body.g.dart';

@JsonSerializable()
class OtpRequestBody {
  final String otpCode;

  OtpRequestBody({required this.otpCode});

  Map<String, dynamic> toJson() => _$OtpRequestBodyToJson(this);
}
