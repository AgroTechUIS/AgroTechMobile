// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

List<ShippingsResponseModel> treatmentsFromJson(String str) =>
    List<ShippingsResponseModel>.from(json
        .decode(str)['treatments']
        .map((x) => ShippingsResponseModel.fromJson(x)));

String treatmentsToJson(List<ShippingsResponseModel> data) => json
    .encode({'treatments': List<dynamic>.from(data.map((x) => x.toJson()))});

class ShippingsResponseModel {
  int? id;
  String? city;
  int? days_to_delivery;
  String? department;
  double? price;
  String? name;
  int? empresa_id;

  ShippingsResponseModel({
    this.id,
    this.city,
    this.days_to_delivery,
    this.department,
    this.price,
    this.name,
    this.empresa_id,
  });

  factory ShippingsResponseModel.fromJson(Map<String, dynamic> json) =>
      ShippingsResponseModel(
        id: json["id"],
        city: json["city"],
        days_to_delivery: json["days_to_delivery"],
        department: json["department"],
        price: json["price"],
        name: json["name"],
        empresa_id: json["empresa_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "city": name,
        "days_to_delivery": days_to_delivery,
        "department": department,
        "price": price,
        "name": name,
        "empresa_id": empresa_id,
      };
}
