import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.init() = _Init;
  const factory AuthFailure.invalidPhoneNumber() = _InvalidPhoneNumber;
  const factory AuthFailure.verifyError() = _VerifyError;
  const factory AuthFailure.credentialSignInError() = _CredentialSignInError;
  const factory AuthFailure.serverError() = _ServerError;
}
