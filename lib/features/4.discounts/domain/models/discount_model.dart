class DiscountModel {
  int? id;
  double? discount;
  DateTime? startDateNum;
  DateTime? endDateNum;
  int? state;
  int? typeDiscount;
  String? store;
  DiscountModel(
      {this.id,
      this.discount,
      this.startDateNum,
      this.endDateNum,
      this.state,
      this.typeDiscount,
      this.store});

  Map<String, dynamic> toJson() => {
        "id": id,
        "discount": discount,
        "startDateNum": startDateNum!.toUtc().millisecondsSinceEpoch,
        "endDateNum": endDateNum!.toUtc().millisecondsSinceEpoch,
        "state": state,
        "typeDiscount": typeDiscount,
        "store": store
      };
  Map<String, dynamic> toJsonPost() => {
        "id": id,
        "discount": discount,
        "startDateNum": startDateNum!.toUtc().millisecondsSinceEpoch,
        "endDateNum": endDateNum!.toUtc().millisecondsSinceEpoch,
        "typeDiscount": typeDiscount,
        "store": store
      };
  factory DiscountModel.fromJson(Map<String, dynamic> json) => DiscountModel(
      id: json["id"],
      discount: json["discount"],
      startDateNum: DateTime.fromMillisecondsSinceEpoch(json["startDateNum"]),
      endDateNum: DateTime.fromMillisecondsSinceEpoch(json["endDateNum"]),
      state: json["state"],
      typeDiscount: json["typeDiscount"],
      store: json["store"]);
}
