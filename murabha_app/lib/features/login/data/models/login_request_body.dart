import 'package:json_annotation/json_annotation.dart';
part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  final String accountId;
  // final String password;

  LoginRequestBody({required this.accountId});
  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}
