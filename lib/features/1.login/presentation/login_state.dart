// coverage:ignore-file
class LoginState {
  final String idusuario;
  final String nombre;
  final String cedula;
  final String correo;
  final String telefono;
  final String rol;
  final String ingreso;
  final int idEmpresa;
  final String errorEmail;
  final String errorPassword;

  LoginState({
    this.idusuario = "",
    this.nombre = "",
    this.cedula = "",
    this.correo = "",
    this.telefono = "",
    this.rol = "",
    this.ingreso = "",
    this.idEmpresa = 0,
    this.errorEmail = "",
    this.errorPassword = "",
  });

  LoginState copyWith({
    String? idusuario,
    String? nombre,
    String? cedula,
    String? correo,
    String? telefono,
    String? rol,
    String? ingreso,
    int? idEmpresa,
    String? errorEmail,
    String? errorPassword,
  }) {
    return LoginState(
      idusuario: idusuario ?? this.idusuario,
      nombre: nombre ?? this.nombre,
      cedula: cedula ?? this.cedula,
      correo: correo ?? this.correo,
      telefono: telefono ?? this.telefono,
      rol: rol ?? this.rol,
      ingreso: ingreso ?? this.ingreso,
      idEmpresa: idEmpresa ?? this.idEmpresa,
      errorEmail: errorEmail ?? this.errorEmail,
      errorPassword: errorPassword ?? this.errorPassword,
    );
  }
}
