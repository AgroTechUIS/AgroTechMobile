List<CropResponseModel> listcropFromJson(List<dynamic> datos) =>
    datos.map((e) => CropResponseModel.fromJson(e)).toList();

class CropResponseModel {
  final int? id;

  CropResponseModel({
    this.id,
  });

  Map<String, dynamic> toJson() => {"id": id};

  factory CropResponseModel.fromJson(Map<String, dynamic> json) =>
      CropResponseModel(
        id: json["id"],
      );
}
