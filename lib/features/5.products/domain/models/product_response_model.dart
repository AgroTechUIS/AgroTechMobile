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
  final double? price;
  final int? state;
  final int? stock;
  final String? description;
  final String? summary;
  final CategoryModel? category;
  final AdjuntoModel? adjunto;
  final dynamic
      discount; // Puedes ajustar el tipo según la estructura real del JSON
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
      this.category,
      this.adjunto,
      this.discount,
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
        "categorie": category?.toJson(),
        "adjunto": adjunto?.toJson(),
        "discount": discount,
      };

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductResponseModel(
          id: json["id"],
          title: json["title"],
          slug: json["slug"],
          sku: json["sku"],
          price: json["priceCop"]?.toDouble(), // Ajusta el nombre según tu JSON
          state: json["state"],
          stock: json["stock"],
          description: json["description"],
          summary: json["resumen"],
          category: CategoryModel.fromJson(json["categorie"]),
          adjunto: AdjuntoModel.fromJson(json["adjunto"]),
          discount: json["discount"],
          crop: json["crop_id"]);
}

class CategoryModel {
  final int? id;
  final String? title;
  final String? imagen;
  final int? state;

  CategoryModel({
    this.id,
    this.title,
    this.imagen,
    this.state,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "imagen": imagen,
        "state": state,
      };

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        title: json["title"],
        imagen: json["imagen"],
        state: json["state"],
      );
}

class AdjuntoModel {
  final int? id;
  final String? url;

  AdjuntoModel({
    this.id,
    this.url,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
      };

  factory AdjuntoModel.fromJson(Map<String, dynamic> json) => AdjuntoModel(
        id: json["id"],
        url: json["url"],
      );
}
