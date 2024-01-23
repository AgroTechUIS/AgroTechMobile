import 'package:agrotech/features/3.opciones_obrero/domain/models/update_activity_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UpdateActivityModel', () {
    test('fromJson() should create a UpdateActivityModel from a map', () {
      final Map<String, dynamic> json = {
        "idActividad": 0,
        "estado": "estado",
        "descripcion": "descripcion",
      };

      final response = UpdateActivityModel.fromJson(json);

      expect(response.idActividad, 0);
      expect(response.estado, "estado");
      expect(response.descripcion, "descripcion");
    });

    test('toJson() should convert a UpdateActivityModel to a map', () {
      final model = UpdateActivityModel(
        idActividad: 0,
        estado: "estado",
        descripcion: "descripcion",
      );

      final json = model.toJson();
      expect(json["idActividad"], 0);
      expect(json["estado"], "estado");
      expect(json["descripcion"], "descripcion");
    });
  });
}
