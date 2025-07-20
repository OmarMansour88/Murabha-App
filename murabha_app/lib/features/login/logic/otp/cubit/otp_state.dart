import 'package:freezed_annotation/freezed_annotation.dart';
part 'otp_state.freezed.dart';

@freezed
class OtpState<T> with _$OtpState<T> {
  const factory OtpState.initial() = _Initial;
  const factory OtpState.loading() = Loading;
  const factory OtpState.success(T responsebody) = Success<T>;
  const factory OtpState.error(String? error) = Failure;
}
