import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import 'package:get/get.dart';

import '../../../config/errors/failures.dart';
import '../../models/usuario_model.dart';
import 'server_api.dart';

class ServerRepository {
  final ServerAPI _api = Get.find<ServerAPI>();

  Future<Either<Failure, UsuarioModel>> getUserByName(String name) =>
      _api.getUserByName(name);

  // Future<Either<Failure, TokenModel>> login(String username, String password) =>
  //     _api.login(username, password);

  // Future<Either<Failure, UsuarioModel>> obtenerUserInfo(String token) =>
  //     _api.obtenerUserInfo(token);

  // Future<Either<Failure, String>> actualizarUsuario(UsuarioModel user) =>
  //     _api.actualizarUsuario(user);

  // Future<void> logout() => _api.logout();

  // Future<Either<Failure, String>> cambiarPassword(
  //         String password, String newpassword) =>
  //     _api.cambiarPassword(password, newpassword);

  // Future<Either<Failure, String>> sendMail(String asunto, String mensaje) =>
  //     _api.sendMail(asunto, mensaje);

  // Future<Either<Failure, int>> getVersion() => _api.getVersion();

  // // Microfranquicias
  // Future<Either<Failure, ClienteModel>> verificarDisponibilidadCliente(
  //         String tipoDoc, String doc) =>
  //     _api.verificarDisponibilidadCliente(tipoDoc, doc);

  // Future<Either<Failure, String>> solicitarCodigoVerificacion(
  //         {int idpersona, String cel, String monto, String plazo}) =>
  //     _api.solicitarCodigoVerificacion(
  //         idpersona: idpersona, cel: cel, monto: monto, plazo: plazo);

  // Future<Either<Failure, bool>> reenviarCodigo(String numero, String mensaje) =>
  //     _api.reenviarCodigo(numero, mensaje);

  // Future<Either<Failure, String>> enviarSolicitud(
  //         String numero, ProformaModel proforma) =>
  //     _api.enviarSolicitud(numero, proforma);

  // Future<Either<Failure, List<ProformaModel>>> obtenerSolicitudes(
  //         int mes, int anio) =>
  //     _api.obtenerSolicitudes(mes, anio);

  // // Agentes
  // Future<Either<Failure, ClienteModel>> buscarClienteByTipoDocAndDoc(
  //         String tipoDoc, String doc) =>
  //     _api.buscarClienteByTipoDocAndDoc(tipoDoc, doc);

  // Future<Either<Failure, AgenteParametroModel>> obtenerParametrosAgente() =>
  //     _api.obtenerParametrosAgente();

  // Future<Either<Failure, List<DestinoSolicitudAgenteModel>>>
  //     obtenerDestinosAgente() => _api.obtenerDestinosAgente();

  // Future<Either<Failure, bool>> subirArchivosAgente(
  //         Uint8List bytes, String filePath, int idsolicitud, String tipo) =>
  //     _api.subirArchivosAgente(bytes, filePath, idsolicitud, tipo);

  // Future<Either<Failure, int>> enviarSolicitudAgente(
  //         SolicitudAgenteModel solicitud) =>
  //     _api.enviarSolicitudAgente(solicitud);

  // Future<Either<Failure, List<SolicitudAgenteModel>>> obtenerReporteAgente(
  //         int mes, int anio) =>
  //     _api.obtenerReporteAgente(mes, anio);

  // Future<Either<Failure, List<SolicitudAgenteModel>>>
  //     solicitudesPendientesAgente() => _api.solicitudesPendientesAgente();

  // Future<Either<Failure, List<SolicitudAgenteModel>>>
  //     solicitudesAprobadosAgente() => _api.solicitudesAprobadosAgente();

  // Future<Either<Failure, List<SolicitudAgenteModel>>>
  //     solicitudesRechazadosAgente() => _api.solicitudesRechazadosAgente();
}
