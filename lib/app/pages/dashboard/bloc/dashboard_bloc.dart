import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_clean_architecture/core/injection_container.dart';
import 'package:flutter_bloc_clean_architecture/domain/usecases/dashboard/get_some_text_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';
part 'dashboard_bloc.freezed.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const _DashboardState()) {
    on<DashboardEvent>((event, emit) async {
      if (event is _GetSomeText) {
        emit(state.copyWith(
          status: null,
          isLoading: true,
        ));
        final response = await serviceLocator<GetSomeTextUseCase>()
            .getSomeText(triggerError: event.triggerError);

        response.fold(
            (l) => emit(state.copyWith(
                  errorMessage: l.message,
                  status: Status.error,
                  isLoading: false,
                )),
            (r) => emit(state.copyWith(
                  someText: r.text,
                  status: Status.success,
                  isLoading: false,
                )));
      }
    });
  }
}
