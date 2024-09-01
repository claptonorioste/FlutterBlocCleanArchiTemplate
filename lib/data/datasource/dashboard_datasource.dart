import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_clean_architecture/core/failure.dart';
import 'package:flutter_bloc_clean_architecture/domain/entities/test_entities.dart';

abstract class DashboardDataSource {
  Future<Either<Failure, TestEntity>> getSomeText();
}

class DashboardDataSourceImpl implements DashboardDataSource {
  @override
  Future<Either<Failure, TestEntity>> getSomeText() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return Right(TestEntity(text: 'Hello World'));
    } catch (e) {
      return Left(ErrorMessage(message: e.toString()));
    }
  }
}
