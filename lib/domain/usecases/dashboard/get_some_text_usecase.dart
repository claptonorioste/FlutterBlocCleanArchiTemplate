import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_clean_architecture/core/failure.dart';
import 'package:flutter_bloc_clean_architecture/core/injection_container.dart';
import 'package:flutter_bloc_clean_architecture/domain/entities/test_entities.dart';
import 'package:flutter_bloc_clean_architecture/domain/repositories/test_repository.dart';

class GetSomeTextUseCase {
  Future<Either<Failure, TestEntity>> getSomeText() {
    return serviceLocator<TestRepository>().getSomeText();
  }
}
