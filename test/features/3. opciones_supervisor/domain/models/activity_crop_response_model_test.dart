import 'package:agrotech/features/3.opciones_supervisor/domain/models/activity_crop_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ActivityCropsResponseModel', () {
    test('fromJson() should create a ActivityCropsResponseModel from a map', () {
      final Map<String, dynamic> json = {
        "idCultivo": 0,
        "actividades": [],
      };

      final response = ActivityCropsResponseModel.fromJson(json);

      expect(response.idCultivo, 0);
      expect(response.actividades, []);
    });

    test('toJson() should convert a ActivityCropsResponseModel to a map', () {
      final model = ActivityCropsResponseModel(
        idCultivo: 0,
        actividades: [],
      );

      final json = model.toJson();
      expect(json["idCultivo"], 0);
      expect(json["actividades"], []);
    });
  });
}
