part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final String data;

  DashboardLoaded(this.data);
}

class DashboardError extends DashboardState {
  final String message;

  DashboardError(this.message);
}
