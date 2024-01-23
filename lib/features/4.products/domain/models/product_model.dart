// coverage:ignore-file
import 'dart:convert';
import 'dart:ffi';

class ProductModel {
  final int? id;
  final String? name;
  final String? slug;
  final String? sku;
  final double? price;
  final int? state;
  final int? stock;
  final String? description;
  final String? summary;
  final int? typeInventario;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic discount;

  ProductModel({
    this.id,
    this.name,
    this.slug,
    this.sku,
    this.price,
    this.state,
    this.stock,
    this.description,
    this.summary,
    this.typeInventario,
    this.createdAt,
    this.updatedAt,
    this.discount,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "sku": sku,
        "price_cop": price,
        "state": state,
        "stock": stock,
        "description": description,
        "resumen": summary,
        "typeInventario": typeInventario,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "discount": discount,
      };

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["title"],
        slug: json["slug"],
        sku: json["sku"],
        price: json["priceCop"]?.toDouble(), // Ajusta el nombre según tu JSON
        state: json["state"],
        stock: json["stock"],
        description: json["description"],
        summary: json["resumen"],
        typeInventario: json["typeInventario"],
        createdAt: DateTime.tryParse(json["createdAt"]),
        updatedAt: DateTime.tryParse(json["updatedAt"]),
        discount: json["discount"],
      );
}
