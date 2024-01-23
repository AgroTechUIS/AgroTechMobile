import 'package:agrotech/features/3.opciones_obrero/domain/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserModel', () {
    test('fromJson() should create a UserModel from a map', () {
      final Map<String, dynamic> json = {
        "id_usuario": "idUsuario",
      };

      final response = UserModel.fromJson(json);

      expect(response.idUsuario, "idUsuario");
    });

    test('toJson() should convert a UserModel to a map', () {
      final model = UserModel(
        idUsuario: "idUsuario",
      );

      final json = model.toJson();
      expect(json["id_usuario"], "idUsuario");
    });
  });
}
