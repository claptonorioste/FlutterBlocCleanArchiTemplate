import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_clean_architecture/core/failure.dart';
import 'package:flutter_bloc_clean_architecture/domain/entities/test_entities.dart';
import 'package:flutter_bloc_clean_architecture/domain/repositories/test_repository.dart';
import 'package:flutter_bloc_clean_architecture/domain/usecases/dashboard/get_some_text_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTestRepository extends Mock implements TestRepository {}

void main() {
  late GetSomeTextUseCase useCase;
  late MockTestRepository mockRepository;

  setUp(() {
    mockRepository = MockTestRepository();
    useCase = GetSomeTextUseCase(mockRepository);
  });

  group('GetSomeTextUseCase', () {
    const tText = 'Hello from repository';
    final tEntity = TestEntity(text: tText);

    test('returns Right(TestEntity) when repository succeeds', () async {
      when(() => mockRepository.getSomeText())
          .thenAnswer((_) async => Right(tEntity));

      final result = await useCase.getSomeText(triggerError: false);

      expect(result, Right(tEntity));
      verify(() => mockRepository.getSomeText()).called(1);
    });

    test('calls repository when triggerError is null', () async {
      when(() => mockRepository.getSomeText())
          .thenAnswer((_) async => Right(tEntity));

      await useCase.getSomeText();

      verify(() => mockRepository.getSomeText()).called(1);
    });

    test('returns Left(ErrorMessage) when triggerError is true', () async {
      final result = await useCase.getSomeText(triggerError: true);

      expect(result.isLeft(), true);
      result.fold(
        (failure) {
          expect(failure, isA<ErrorMessage>());
          expect(failure.message.toString(), contains('Something went wrong'));
        },
        (_) => fail('Expected Left'),
      );
      verifyNever(() => mockRepository.getSomeText());
    });

    test('returns Left when repository fails', () async {
      const tFailure = ErrorMessage(message: 'Repository error');
      when(() => mockRepository.getSomeText())
          .thenAnswer((_) async => const Left(tFailure));

      final result = await useCase.getSomeText(triggerError: false);

      expect(result, const Left(tFailure));
      verify(() => mockRepository.getSomeText()).called(1);
    });
  });
}
