import 'package:agrotech/features/3.opciones_supervisor/domain/models/activity_crop_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/buy_client_model.dart';

class BillModel {
  int? idFactura;
  String? numeroFactura;
  String? fecha;
  String? tipo;
  double? total;
  ActivityCropModel? actividadObrero;
  List<BuyClientModel>? compras;

  BillModel({
    this.idFactura,
    this.numeroFactura,
    this.fecha,
    this.tipo,
    this.total,
    this.actividadObrero,
    this.compras,
  });

  BillModel.fromJson(Map<String, dynamic> json) {
    idFactura = json["idFactura"];
    numeroFactura = json["numeroFactura"];
    fecha = json["fecha"];
    tipo = json["tipo"];
    total = json["total"];
    actividadObrero = json["actividadObrero"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["idFactura"] = idFactura;
    data["numeroFactura"] = numeroFactura;
    data["fecha"] = fecha;
    data["tipo"] = tipo;
    data["total"] = total;
    data["actividadObrero"] = actividadObrero;
    return data;
  }
}
