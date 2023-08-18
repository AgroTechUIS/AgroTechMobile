class CompanyModel {
  int? idEmpresa;

  CompanyModel({this.idEmpresa});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    idEmpresa = json["idEmpresa"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["idEmpresa"] = idEmpresa;
    return data;
  }
}
