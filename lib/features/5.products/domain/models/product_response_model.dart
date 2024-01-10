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
  final CategoryModel? category;
  final AdjuntoModel? adjunto;
  final dynamic
      discount; // Puedes ajustar el tipo según la estructura real del JSON
  final int? crop;
  ProductResponseModel(
      {this.id,
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
      this.category,
      this.adjunto,
      this.discount,
      this.crop});

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
        "categorie": category?.toJson(),
        "adjunto": adjunto?.toJson(),
        "discount": discount,
      };

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductResponseModel(
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
          category: CategoryModel.fromJson(json["categorie"]),
          adjunto: AdjuntoModel.fromJson(json["adjunto"]),
          discount: json["discount"],
          crop: json["crop_id"]);
}

class CategoryModel {
  final int? id;
  final String? title;
  final String? slug;
  final String? imagen;
  final int? state;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CategoryModel({
    this.id,
    this.title,
    this.slug,
    this.imagen,
    this.state,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "imagen": imagen,
        "state": state,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        imagen: json["imagen"],
        state: json["state"],
        createdAt: DateTime.tryParse(json["created_at"]),
        updatedAt: DateTime.tryParse(json["updated_at"]),
      );
}

class AdjuntoModel {
  final int? id;
  final String? url;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AdjuntoModel({
    this.id,
    this.url,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  factory AdjuntoModel.fromJson(Map<String, dynamic> json) => AdjuntoModel(
        id: json["id"],
        url: json["url"],
        createdAt: DateTime.tryParse(json["created_at"]),
        updatedAt: DateTime.tryParse(json["updated_at"]),
      );
}
