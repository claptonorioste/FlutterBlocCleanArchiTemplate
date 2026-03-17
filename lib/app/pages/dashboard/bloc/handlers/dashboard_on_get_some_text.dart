import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture/app/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter_bloc_clean_architecture/core/injection_container.dart';
import 'package:flutter_bloc_clean_architecture/domain/usecases/dashboard/get_some_text_usecase.dart';

extension DashboardOnGetSomeText on DashboardBloc {
  Future<void> onGetSomeText(DashboardEvent event, Emitter<DashboardState> emit) async {
    final triggerError = event.maybeWhen(getSomeText: (bool? t) => t, orElse: () => null);
    final getSomeText = serviceLocator<GetSomeTextUseCase>();

    emit(state.copyWith(status: null, isLoading: true, errorMessage: ''));

    final result = await getSomeText.getSomeText(triggerError: triggerError);

    result.fold(
      (failure) => emit(state.copyWith(
        errorMessage: failure.message?.toString(),
        status: Status.error,
        isLoading: false,
      )),
      (entity) => emit(state.copyWith(
        someText: entity.text,
        status: Status.success,
        isLoading: false,
        errorMessage: '',
      )),
    );
  }
}
