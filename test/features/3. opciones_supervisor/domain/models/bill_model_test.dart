import 'package:agrotech/features/3.opciones_supervisor/domain/models/activity_crop_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/bill_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BillModel', () {
    test('fromJson() should create a BillModel from a map', () {
      final Map<String, dynamic> json = {
        "id": 0,
        "fecha": "2012-02-27",
        "tipo": "tipo",
        "total": 0.0,
        "actividadObrero": {"id": 0},
        "ventas": [],
        "compras": [],
      };

      final response = BillModel.fromJson(json);

      expect(response.id, 0);
      expect(response.fecha, DateTime.parse('2012-02-27'));
      expect(response.tipo, "tipo");
      expect(response.total, 0.0);
      expect(response.actividadObrero, isInstanceOf<ActivityCropModel>());
    });

    test('toJson() should convert a BillModel to a map', () {
      final model = BillModel(
        id: 0,
        fecha: DateTime(0),
        tipo: "tipo",
        total: 0.0,
        actividadObrero: ActivityCropModel(),
        ventas: [],
        compras: [],
      );

      final json = model.toJson();
      expect(json["id"], 0);
      expect(json["fecha"], "0000-01-01 00:00:00.000");
      expect(json["tipo"], "tipo");
      expect(json["total"], 0.0);
      expect(json["actividadObrero"], isInstanceOf<ActivityCropModel>());
    });
  });
}
