import 'package:agrotech/features/3.opciones_supervisor/domain/models/activity_crop_model.dart';
import 'package:agrotech/features/3.opciones_supervisor/domain/models/buy_client_model.dart';

class BillModel {
  int? id;
  String? numeroFactura;
  DateTime? fecha;
  String? tipo;
  double? total;
  ActivityCropModel? actividadObrero;
  List<BuyClientModel>? ventas;
  List<BuyClientModel>? compras;

  BillModel({
    this.id,
    this.numeroFactura,
    this.fecha,
    this.tipo,
    this.total,
    this.actividadObrero,
    this.ventas,
    this.compras,
  });

  BillModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    numeroFactura = json["numeroFactura"];
    fecha = DateTime.parse(json["fecha"]);
    tipo = json["tipo"];
    total = json["total"];
    actividadObrero = ActivityCropModel.fromJson(json["actividadObrero"] ?? {});
    ventas = json["compraCliente"] != null
        ? (json["compraCliente"] as List).map((e) => BuyClientModel.fromJson(e)).toList()
        : null;
    compras = json["ventaProveedor"] != null
        ? (json["ventaProveedor"] as List).map((e) => BuyClientModel.fromJson(e)).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["numeroFactura"] = numeroFactura;
    data["fecha"] = fecha.toString();
    data["tipo"] = tipo;
    data["total"] = total;
    data["actividadObrero"] = actividadObrero;
    data["compraCliente"] = ventas;
    data["ventaProveedor"] = compras;

    return data;
  }
}
