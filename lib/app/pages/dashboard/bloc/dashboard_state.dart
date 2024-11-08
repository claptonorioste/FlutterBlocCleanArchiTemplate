part of 'dashboard_bloc.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default('') String? someText,
    @Default('') String? errorMessage,
    @Default(false) bool isLoading,
    @Default(null) Status? status,
  }) = _DashboardState;
}

enum Status { success, error }
