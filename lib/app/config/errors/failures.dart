import 'package:equatable/equatable.dart';

import 'errors_messages.dart';

abstract class Failure extends Equatable {
  final String mensaje;

  const Failure({required this.mensaje});
}

class CacheFailure extends Failure {
  const CacheFailure({String mensaje = FailureMessages.CACHE_FAILURE})
      : super(mensaje: mensaje);

  @override
  List<Object> get props => [mensaje];
}

class ServerFailure extends Failure {
  const ServerFailure({String mensaje = FailureMessages.SERVEVER_FAILURE})
      : super(mensaje: mensaje);
  @override
  List<Object> get props => [mensaje];
}

class AuthFailure extends Failure {
  const AuthFailure({String mensaje = FailureMessages.AUTH_FAILURE})
      : super(mensaje: mensaje);
  @override
  List<Object> get props => [mensaje];
}

class NoDataFailure extends Failure {
  const NoDataFailure({required String mensaje}) : super(mensaje: mensaje);
  @override
  List<Object> get props => [mensaje];
}
