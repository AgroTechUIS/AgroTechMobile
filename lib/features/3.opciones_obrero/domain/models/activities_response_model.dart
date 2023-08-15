import 'package:agrotech/features/3.opciones_obrero/domain/models/activity_model.dart';

class ActivitiesResponseModel {
  List<ActivityModel>? activities;
  String? error;

  ActivitiesResponseModel({
    this.activities,
    this.error,
  });

  ActivitiesResponseModel.fromJson(Map<String, dynamic> json) {
    var mapList = json["actividades"] as List<dynamic>;
    activities = mapList.map((actividadJson) {
      return ActivityModel.fromJson(actividadJson);
    }).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["actividades"] = activities;
    return data;
  }
}
