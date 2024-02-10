import 'dart:convert';

List<ProductResponseModel> productFromJson(String str) =>
    List<ProductResponseModel>.from(
        json.decode(str).map((x) => ProductResponseModel.fromJson(x)));

String productToJson(List<ProductResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<ProductResponseModel> listplagaFromJson(List<dynamic> datos) =>
    datos.map((e) => ProductResponseModel.fromJson(e)).toList();

class ProductResponseModel {
  final int? id;
  final String? title;
  final String? slug;
  final String? sku;
  final double? priceCop;
  final int? state;
  final int? stock;
  final String? description;
  final String? resumen;
  final int? crop;
  final int? categorie;
  final int? discount;

  final String? store;
  final String? image;
  final String? email;

  ProductResponseModel(
      {this.id,
      this.title,
      this.slug,
      this.sku,
      this.priceCop,
      this.state,
      this.stock,
      this.description,
      this.resumen,
      this.crop,
      this.categorie,
      this.store,
      this.discount,
      this.image,
      this.email});

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "sku": sku,
        "priceCop": priceCop,
        "email": email,
        "state": state,
        "stock": stock,
        "description": description,
        "resumen": resumen,
        "categorie": categorie,
        "store": store,
        "image": image
      };

  Map<String, dynamic> toJsonPost() => {
        "title": title,
        "sku": sku,
        "priceCop": priceCop,
        "email": email,
        "stock": stock,
        "description": description,
        "resumen": resumen,
        "categorie": categorie,
        "crop": crop,
        "store": store,
        "image": image
      };

  Map<String, dynamic> toJsonPut() => {
        "id": id,
        "title": title,
        "sku": sku,
        "priceCop": priceCop,
        "email": email,
        "stock": stock,
        "description": description,
        "resumen": resumen,
        "categorie": categorie,
        "discount": discount,
      };
  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductResponseModel(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        sku: json["sku"],
        priceCop: json["priceCop"],
        state: json["state"],
        stock: json["stock"],
        description: json["description"],
        resumen: json["resumen"],
        //categorie: json["categorie"],
        //  image: json["image"]
      );
}
