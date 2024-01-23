import 'package:agrotech/features/3.opciones_supervisor/domain/models/company_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CompanyModel', () {
    test('fromJson() should create a CompanyModel from a map', () {
      final Map<String, dynamic> json = {
        "idEmpresa": 0,
      };

      final response = CompanyModel.fromJson(json);

      expect(response.idEmpresa, 0);
    });

    test('toJson() should convert a CompanyModel to a map', () {
      final model = CompanyModel(
        idEmpresa: 0,
      );

      final json = model.toJson();
      expect(json["idEmpresa"], 0);
    });
  });
}
