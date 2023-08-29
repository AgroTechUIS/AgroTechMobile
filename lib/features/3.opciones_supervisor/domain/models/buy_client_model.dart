class BuyClientModel {
  int? id;
  String? cliente;
  int? unidades;
  String? planta;
  double? precio;

  BuyClientModel({
    this.id,
    this.cliente,
    this.unidades,
    this.planta,
    this.precio,
  });

  BuyClientModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    cliente = json["cliente"] ?? json["proveedor"];
    unidades = json["unidades"];
    planta = json["planta"] ?? json["insumo"];
    precio = json["precio"] ?? json["costo"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["cliente"] = cliente;
    data["unidades"] = unidades;
    data["planta"] = planta;
    data["precio"] = precio;
    return data;
  }
}
