import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_clean_architecture/core/failure.dart';
import 'package:flutter_bloc_clean_architecture/domain/entities/test_entities.dart';

abstract class TestRepository {
  Future<Either<Failure, TestEntity>> getSomeText();
}
