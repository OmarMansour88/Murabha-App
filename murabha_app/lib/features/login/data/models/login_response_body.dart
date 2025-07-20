import 'package:json_annotation/json_annotation.dart';
part 'login_response_body.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "body")
  final RequestBody? requestBody;
  final String? customerMnemonic;
  final String? accountId;
  final String? customerShortName;
  final String? nationalityName;

  LoginResponse(
    this.customerMnemonic,
    this.accountId,
    this.customerShortName,
    this.nationalityName, {
    this.requestBody,
  });
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class RequestBody {
  final String? customerMnemonic;
  final String? accountId;
  final String? customerShortName;
  final String? nationalityName;

  RequestBody({
    this.customerMnemonic,
    this.accountId,
    this.customerShortName,
    this.nationalityName,
  });
  factory RequestBody.fromJson(Map<String, dynamic> json) =>
      _$RequestBodyFromJson(json);
}
