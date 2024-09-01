import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final dynamic message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ErrorMessage extends Failure {
  const ErrorMessage({required message}) : super(message);
}
