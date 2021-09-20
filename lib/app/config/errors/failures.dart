import 'package:equatable/equatable.dart';

import 'errors_messages.dart';

abstract class Failure extends Equatable {
  final String mensaje;

  Failure({required this.mensaje});
}

class CacheFailure extends Failure {
  CacheFailure({String mensaje = FailureMessages.CACHE_FAILURE})
      : super(mensaje: mensaje);

  @override
  List<Object> get props => [mensaje];
}

class ServerFailure extends Failure {
  ServerFailure({String mensaje = FailureMessages.SERVEVER_FAILURE})
      : super(mensaje: mensaje);
  @override
  List<Object> get props => [mensaje];
}

class AuthFailure extends Failure {
  AuthFailure({String mensaje = FailureMessages.AUTH_FAILURE})
      : super(mensaje: mensaje);
  @override
  List<Object> get props => [mensaje];
}

class NoDataFailure extends Failure {
  NoDataFailure({required String mensaje}) : super(mensaje: mensaje);
  @override
  List<Object> get props => [mensaje];
}

class CustomFailure extends Failure {
  CustomFailure({String mensaje = FailureMessages.CUSTOM_FAILURE})
      : super(mensaje: mensaje);
  @override
  List<Object> get props => [mensaje];
}
