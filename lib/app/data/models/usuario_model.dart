import 'dart:convert';

class UsuarioModel {
  UsuarioModel({
    required this.nombre,
    required this.id,
    required this.clave,
    required this.vendedor,
    required this.vendedorId,
  });

  final String nombre;
  final int id;
  final String clave;
  final String vendedor;
  final dynamic vendedorId;

  factory UsuarioModel.fromJson(String str) =>
      UsuarioModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromMap(Map<String, dynamic> json) => UsuarioModel(
        nombre: json["nombre"],
        id: json["id"],
        clave: json["clave"],
        vendedor: json["vendedor"],
        vendedorId: json["vendedor_id"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "id": id,
        "clave": clave,
        "vendedor": vendedor,
        "vendedor_id": vendedorId,
      };

  static List<UsuarioModel> fromJsonList(List<dynamic> jsonList) {
    List<UsuarioModel> list = [];

    for (var item in jsonList) {
      final p = UsuarioModel.fromMap(item);
      list.add(p);
    }
    return list;
  }
}
