import 'package:agrotech/features/3.opciones_supervisor/domain/models/activity_crop_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ActivityCropModel', () {
    test('fromJson() should create a ActivityCropModel from a map', () {
      final Map<String, dynamic> json = {
        "id": 0,
        "nombre": "nombre",
        "finca": "finca",
        "zona": "zona",
        "fecha": "fecha",
        "estado": "estado",
        "obrero": "obrero",
      };

      final response = ActivityCropModel.fromJson(json);

      expect(response.id, 0);
      expect(response.nombre, "nombre");
      expect(response.finca, "finca");
      expect(response.zona, "zona");
      expect(response.fecha, "fecha");
      expect(response.estado, "estado");
      expect(response.obrero, "obrero");
    });

    test('toJson() should convert a ActivityCropModel to a map', () {
      final model = ActivityCropModel(
        id: 0,
        nombre: "nombre",
        finca: "finca",
        zona: "zona",
        fecha: "fecha",
        estado: "estado",
        obrero: "obrero",
      );

      final json = model.toJson();
      expect(json["id"], 0);
      expect(json["nombre"], "nombre");
      expect(json["finca"], "finca");
      expect(json["zona"], "zona");
      expect(json["fecha"], "fecha");
      expect(json["estado"], "estado");
      expect(json["obrero"], "obrero");
    });
  });
}
