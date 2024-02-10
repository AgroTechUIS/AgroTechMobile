import 'package:agrotech/features/3.opciones_supervisor/domain/models/crop_model.dart';

class CropsResponseModel {
  int? idEmpresa;
  List<CropModel>? cultivos;
  String? error;

  CropsResponseModel({
    this.idEmpresa,
    this.cultivos,
    this.error,
  });

  CropsResponseModel.fromJson(Map<String, dynamic> json) {
    idEmpresa = json["idEmpresa"];
    var mapList = json["cultivos"] as List<dynamic>;
    cultivos = mapList.map((actividadJson) {
      return CropModel.fromJson(actividadJson);
    }).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["idEmpresa"] = idEmpresa;
    data["cultivos"] = cultivos;
    return data;
  }
}
