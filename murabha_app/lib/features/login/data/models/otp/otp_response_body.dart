import 'package:json_annotation/json_annotation.dart';
part 'otp_response_body.g.dart';

@JsonSerializable()
class OtpResposeBody {
  final String? message;

  OtpResposeBody(this.message);
  factory OtpResposeBody.fromJson(Map<String, dynamic> json) =>
      _$OtpResposeBodyFromJson(json);
}
