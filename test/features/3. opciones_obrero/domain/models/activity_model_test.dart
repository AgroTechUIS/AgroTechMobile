import 'package:agrotech/features/3.opciones_obrero/domain/models/activity_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ActivityModel', () {
    test('fromJson() should create a ActivityModel from a map', () {
      final Map<String, dynamic> json = {
        "id": 0,
        "nombre": "nombre",
        "finca": "finca",
        "zona": "zona",
        "fecha": "2012-02-27",
        "estado": "estado",
        "periodico": "periodico",
      };

      final response = ActivityModel.fromJson(json);

      expect(response.id, 0);
      expect(response.nombre, "nombre");
      expect(response.finca, "finca");
      expect(response.zona, "zona");
      expect(response.fecha, DateTime.parse('2012-02-27'));
      expect(response.estado, "estado");
      expect(response.periodico, "periodico");
    });

    test('toJson() should convert a ActivityModel to a map', () {
      final model = ActivityModel(
        id: 0,
        nombre: "nombre",
        finca: "finca",
        zona: "zona",
        fecha: DateTime(0),
        estado: "estado",
        periodico: "periodico",
      );

      final json = model.toJson();
      expect(json["id"], 0);
      expect(json["nombre"], "nombre");
      expect(json["finca"], "finca");
      expect(json["zona"], "zona");
      expect(json["fecha"], "0000-01-01 00:00:00.000");
      expect(json["estado"], "estado");
      expect(json["periodico"], "periodico");
    });
  });
}
