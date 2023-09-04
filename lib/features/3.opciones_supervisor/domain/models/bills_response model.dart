import 'package:agrotech/features/3.opciones_supervisor/domain/models/bill_model.dart';

class BillsResponseModel {
  int? idEmpresa;
  List<BillModel>? facturas;
  String? error;

  BillsResponseModel({
    this.idEmpresa,
    this.facturas,
    this.error,
  });

  BillsResponseModel.fromJson(Map<String, dynamic> json) {
    idEmpresa = json["idEmpresa"];
    List mapList = json["facturasCliente"] ?? json["facturasProveedor"] ?? json["facturasObreros"];
    facturas = mapList.map((actividadJson) {
      return BillModel.fromJson(actividadJson);
    }).toList();
  }
}
