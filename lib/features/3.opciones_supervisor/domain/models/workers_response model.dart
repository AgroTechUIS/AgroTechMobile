/*import 'package:agrotech/features/3.opciones_supervisor/domain/models/crop_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/worker_model.dart';

class CropsResponseModel {
  List<WorkerModel>? cultivos;

  CropsResponseModel({
    this.cultivos,
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
}*/
