// coverage:ignore-file
import 'dart:convert';

List<ProductResponseModel> productFromJson(String str) =>
    List<ProductResponseModel>.from(json.decode(str).map((x) => ProductResponseModel.fromJson(x)));

String productToJson(List<ProductResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<ProductResponseModel> listplagaFromJson(List<dynamic> datos) =>
    datos.map((e) => ProductResponseModel.fromJson(e)).toList();

class ProductResponseModel {
  final int? id;
  final String? title;
  final String? slug;
  final String? sku;
  final double? price;
  final int? state;
  final int? stock;
  final String? description;
  final String? summary;
  final int? crop;
  ProductResponseModel(
      {this.id,
      this.title,
      this.slug,
      this.sku,
      this.price,
      this.state,
      this.stock,
      this.description,
      this.summary,
      this.crop});

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "sku": sku,
        "priceCop": price,
        "state": state,
        "stock": stock,
        "description": description,
        "resumen": summary,
      };

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) => ProductResponseModel(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        sku: json["sku"],
        price: json["priceCop"]?.toDouble(), // Ajusta el nombre según tu JSON
        state: json["state"],
        stock: json["stock"],
        description: json["description"],
        summary: json["resumen"],
      );
}
