import 'package:flutter_bloc_clean_architecture/app/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter_bloc_clean_architecture/data/datasource/dashboard_datasource.dart';
import 'package:flutter_bloc_clean_architecture/data/repositories/data_test_repository.dart';
import 'package:flutter_bloc_clean_architecture/domain/repositories/test_repository.dart';
import 'package:flutter_bloc_clean_architecture/domain/usecases/dashboard/get_some_text_usecase.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerFactory(() => DashboardBloc());
  serviceLocator.registerFactory(() => GetSomeTextUseCase());
  serviceLocator.registerFactory<TestRepository>(() => TestDataRepoImpl());
  serviceLocator.registerFactory(() => DashboardDataSourceImpl());
}
