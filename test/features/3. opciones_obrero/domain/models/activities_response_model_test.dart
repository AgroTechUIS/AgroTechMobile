import 'package:agrotech/features/3.opciones_obrero/domain/models/activities_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ActivitiesResponseModel', () {
    test('fromJson() should create a ActivitiesResponseModel from a map', () {
      final Map<String, dynamic> json = {
        "actividades": [],
      };

      final response = ActivitiesResponseModel.fromJson(json);

      expect(response.activities, []);
    });

    test('toJson() should convert a ActivitiesResponseModel to a map', () {
      final model = ActivitiesResponseModel(
        activities: [],
      );

      final json = model.toJson();
      expect(json["actividades"], []);
    });
  });
}
