class OrderModel {
  int? id;
  String? product;
  String? product_title;
  String? image;
  int? cantidad;
  String? direccion;
  String? city;
  double? subtotal;
  String? status;
  String? telephone;
  String? name_delivery;
  String? telephone_delivery;
  double? total;

  OrderModel(
      {this.id,
      this.product,
      this.product_title,
      this.image,
      this.cantidad,
      this.direccion,
      this.city,
      this.subtotal,
      this.status,
      this.telephone,
      this.name_delivery,
      this.telephone_delivery,
      this.total});

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
      id: json["id"],
      product: json["product"],
      product_title: json["product_title"],
      image: json["image"],
      cantidad: json["cantidad"],
      direccion: json["direccion"],
      city: json["city"],
      subtotal: json["subtotal"],
      status: json["status"],
      telephone: json["telephone"],
      name_delivery: json["name_delivery"],
      telephone_delivery: json["telephone_delivery"],
      total: json["total"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_delivery": name_delivery,
        "telephone_delivery": telephone_delivery
      };
}
