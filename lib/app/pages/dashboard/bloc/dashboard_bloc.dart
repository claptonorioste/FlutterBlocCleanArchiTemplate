import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_clean_architecture/app/pages/dashboard/bloc/handlers/dashboard_on_get_some_text.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';
part 'dashboard_bloc.freezed.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const _DashboardState()) {
    on<_GetSomeText>(onGetSomeText);
  }
}
