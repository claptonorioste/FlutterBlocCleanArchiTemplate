import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_clean_architecture/core/injection_container.dart';
import 'package:flutter_bloc_clean_architecture/domain/usecases/dashboard/get_some_text_usecase.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardEvent>((event, emit) async {
      if (event is GetSomeText) {
        emit(DashboardLoading());
        var result = await serviceLocator<GetSomeTextUseCase>().getSomeText();

        result.fold((failure) => emit(DashboardError(failure.message)),
            (data) => emit(DashboardLoaded(data.text)));
      }
    });
  }
}
