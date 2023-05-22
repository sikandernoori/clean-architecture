import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({this.message = ""});

  @override
  List<Object?> get props => [message];
}

class NetworkFailure extends Failure {} // Un-used: Should be used when remote data source is implemented.

class ServerFailure extends Failure {} // Un-used: Should be used when remote data source is implemented.

class UnknownFailure extends Failure {}

class ArithemeticFailure extends Failure {}
