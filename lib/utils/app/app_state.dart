import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.unAuthenticated() = _UnAuthenticated;
  const factory AppState.authenticated() = _Authenticated;
  const factory AppState.phoneSignInLoading() = _PhoneSignInLoading;
}
