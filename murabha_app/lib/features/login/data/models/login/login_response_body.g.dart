// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      json['customerMnemonic'] as String?,
      json['accountId'] as String?,
      json['customerShortName'] as String?,
      json['nationalityName'] as String?,
      requestBody: json['body'] == null
          ? null
          : RequestBody.fromJson(json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'body': instance.requestBody,
      'customerMnemonic': instance.customerMnemonic,
      'accountId': instance.accountId,
      'customerShortName': instance.customerShortName,
      'nationalityName': instance.nationalityName,
    };

RequestBody _$RequestBodyFromJson(Map<String, dynamic> json) => RequestBody(
  customerMnemonic: json['customerMnemonic'] as String?,
  accountId: json['accountId'] as String?,
  customerShortName: json['customerShortName'] as String?,
  nationalityName: json['nationalityName'] as String?,
);

Map<String, dynamic> _$RequestBodyToJson(RequestBody instance) =>
    <String, dynamic>{
      'customerMnemonic': instance.customerMnemonic,
      'accountId': instance.accountId,
      'customerShortName': instance.customerShortName,
      'nationalityName': instance.nationalityName,
    };
