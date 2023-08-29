import 'package:agrotech/features/3.opciones_supervisor/domain/models/activity_crop_model.dart';

class ActivityCropsResponseModel {
  int? idCultivo;
  List<ActivityCropModel>? actividades;
  String? error;

  ActivityCropsResponseModel({
    this.idCultivo,
    this.actividades,
    this.error,
  });

  ActivityCropsResponseModel.fromJson(Map<String, dynamic> json) {
    idCultivo = json["idCultivo"];
    var mapList = json["actividades"] as List<dynamic>;
    actividades = mapList.map((actividadJson) {
      return ActivityCropModel.fromJson(actividadJson);
    }).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["idCultivo"] = idCultivo;
    data["actividades"] = actividades;
    return data;
  }
}
