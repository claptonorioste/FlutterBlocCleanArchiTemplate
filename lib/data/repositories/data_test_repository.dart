import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_clean_architecture/core/failure.dart';
import 'package:flutter_bloc_clean_architecture/core/injection_container.dart';
import 'package:flutter_bloc_clean_architecture/data/datasource/dashboard_datasource.dart';
import 'package:flutter_bloc_clean_architecture/domain/entities/test_entities.dart';
import 'package:flutter_bloc_clean_architecture/domain/repositories/test_repository.dart';

class TestDataRepoImpl extends TestRepository {
  @override
  Future<Either<Failure, TestEntity>> getSomeText() {
    return serviceLocator<DashboardDataSourceImpl>().getSomeText();
  }
}
