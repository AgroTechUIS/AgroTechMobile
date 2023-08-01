import 'package:agrotech/common_utilities/models/rol_model.dart';

class UserModel {
  final String? nombre;
  final String? apellido;
  final int? cedula;
  final String? correo;
  final List<RolModel>? roles;

  UserModel({
    this.nombre,
    this.apellido,
    this.cedula,
    this.correo,
    this.roles,
  });
}
